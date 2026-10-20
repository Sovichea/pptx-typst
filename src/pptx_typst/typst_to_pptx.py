#!/usr/bin/env python3
"""Bounded reverse POC for v8 generated Place-based Typst, not an arbitrary Typst interpreter.

Input: main.typ + original media. Output: PPTX with native pictures, editable text,
rectangles and lines. Group local coordinates are resolved; grouping editability is
not yet reconstructed. Unsupported Typst forms are reported in a JSON audit.
"""
import argparse, ast, hashlib, io, json, math, os, re
from pathlib import Path
from PIL import Image
from pptx import Presentation
from pptx.util import Pt
from pptx.dml.color import RGBColor
from pptx.enum.shapes import MSO_SHAPE, MSO_CONNECTOR
from pptx.enum.text import PP_ALIGN, MSO_ANCHOR
from pptx.oxml.xmlchemy import OxmlElement

PX_PER_PT = 1.0
NUM = r'[-+]?\d+(?:\.\d+)?'

# Calls provided by the starter module are intentionally thin aliases for the
# supported Root/Place and native Typst primitives. Normalize them before
# parsing so users can author through the module without expanding arbitrary
# Typst functions or evaluating Typst code.
STARTER_ALIASES = {
    'PptxSlide': 'Root',
    'PptxPlace': 'Place',
    'PptxGroup': 'GroupContent',
    'PptxClip': 'box',
    'PptxBox': 'box',
    'PptxText': 'text',
    'PptxImage': 'image',
    'PptxRect': 'rect',
    'PptxEllipse': 'ellipse',
    'PptxLine': 'line',
}


def normalize_starter_aliases(content):
    for alias, target in STARTER_ALIASES.items():
        content = re.sub(
            r'(?<![\w-])(#?)' + alias + r'(?=\s*\()',
            lambda match: match.group(1) + target,
            content,
        )
    return content


def balanced(s, pos, left='(', right=')'):
    assert s[pos] == left, (s[pos:pos+30],left)
    d=1; q=None; esc=False; i=pos+1
    while i<len(s):
        c=s[i]
        if q:
            if esc: esc=False
            elif c=='\\': esc=True
            elif c==q: q=None
        elif c in ('"',"'"): q=c
        elif c==left: d+=1
        elif c==right:
            d-=1
            if d==0: return s[pos+1:i], i+1
        i+=1
    raise ValueError(f'unbalanced {left} at {pos}')


def argsplit(raw):
    arr=[]; start=0; qs=None; esc=False; stack=[]; opens={'(':')','[':']','{':'}'}
    for i,c in enumerate(raw):
        if qs:
            if esc: esc=False
            elif c=='\\': esc=True
            elif c==qs: qs=None
        elif c in ('"',"'"):qs=c
        elif c in opens:stack.append(opens[c])
        elif stack and c==stack[-1]:stack.pop()
        elif c==',' and not stack:
            arr.append(raw[start:i].strip());start=i+1
    tail=raw[start:].strip()
    if tail:arr.append(tail)
    return arr


def kwargs(raw):
    r={};pos=[]
    for a in argsplit(raw):
        m=re.match(r'^([\w-]+)\s*:\s*(.*)$',a,re.S)
        if m:r[m.group(1)]=m.group(2).strip()
        else:pos.append(a)
    if pos:r['_pos']=pos
    return r


def length(s,default=0.0):
    if s is None:return default
    m=re.search(NUM,s)
    return float(m.group()) if m else default


def find_calls(s,which):
    pat=re.compile(r'#'+re.escape(which)+r'\(')
    i=0
    while True:
        m=pat.search(s,i)
        if not m:break
        raw,end=balanced(s,m.end()-1)
        yield raw,m.start(),end
        i=end


def simple_color(s,default=(0,0,0)):
    if not s:return default
    m=re.search(r'#([\da-fA-F]{6})',s)
    if m:
        h=m.group(1);return tuple(int(h[i:i+2],16) for i in (0,2,4))
    if 'white' in s:return (255,255,255)
    if 'black' in s:return (0,0,0)
    return default


def txt_decode(v):
    if not v:return ''
    v=v.strip()
    if v.startswith('"'):
        try:return json.loads(v)
        except Exception:
            try:return ast.literal_eval(v)
            except Exception:return v.strip('"')
    if v.startswith('[') and v.endswith(']'):return v[1:-1]
    return v


def img_call(child):
    match = re.search(r'#?image\(',child)
    if not match:return None
    raw,end=balanced(child,match.end()-1)
    a=kwargs(raw)
    if not a.get('_pos'):return None
    path=txt_decode(a['_pos'][0]);return dict(path=path,iw=length(a.get('width')),ih=length(a.get('height')))


def flip(child):
    m=re.search(r'(?<![\w])scale\(\s*x\s*:\s*(-?\d+)%\s*,\s*y\s*:\s*(-?\d+)%',child)
    return (float(m.group(1))<0,float(m.group(2))<0) if m else (False,False)


def viewport(child):
    # PowerPoint image fill: explicit clip box and inner image shifted into viewport.
    m=re.search(r'box\(\s*width\s*:\s*('+NUM+r')pt\s*,\s*height\s*:\s*('+NUM+r')pt\s*,\s*clip\s*:\s*true',child)
    if not m:return None
    w,h=map(float,m.groups())
    n=re.search(r'#place\(\s*top\s*\+\s*left\s*,\s*dx\s*:\s*('+NUM+r')pt\s*,\s*dy\s*:\s*('+NUM+r')pt',child)
    dx,dy=map(float,n.groups()) if n else (0,0)
    return w,h,dx,dy


def text_runs(child):
    out=[]
    for raw,_,_ in find_calls(child,'text'):
        a=kwargs(raw); pos=a.get('_pos',[])
        if not pos:continue
        content=txt_decode(pos[-1]);
        if not content:continue
        out.append(dict(text=content,font=txt_decode(a.get('font','"Aptos"')),size=length(a.get('size'),20),color=simple_color(a.get('fill')),bold='bold' in a.get('weight','').lower()))
    return out


def show_unsupported(audit,kind,expr,slide):
    audit['unsupported'].append({'slide':slide,'kind':kind,'example':expr[:170].replace('\n',' ')})


def add_image(slide, obj, base, x,y,rot,alpha_cache,audit,slide_num):
    child=obj; im=img_call(child)
    if not im:return False
    f=(base/im['path']).resolve()
    if not str(f).startswith(str(base.resolve())) or not f.is_file():
        show_unsupported(audit,'missing_media',str(f),slide_num);return True
    W=im['iw'];H=im['ih']; crop=viewport(child)
    if W<=0 or H<=0:return True
    xf,yf=flip(child)
    if crop:
        w,h,dx,dy=crop
    else:
        w,h,dx,dy=W,H,0.0,0.0
    # Case negative crop or source extends under/over requested viewport: use one object-only
    # raster fallback, retaining original artwork and alpha. This does not flatten slides.
    left=-dx/W; top=-dy/H; right=1-(w-dx)/W; bottom=1-(h-dy)/H
    safe=all(v>=-0.0001 for v in (left,top,right,bottom)) and left+right<0.999 and top+bottom<0.999
    image_path=f
    if f.suffix.lower()=='.svg':
        import cairosvg
        token=hashlib.sha256(f.read_bytes()+f'{W:.2f}x{H:.2f}'.encode()).hexdigest()[:14]
        image_path=alpha_cache/f'{token}.png'
        if not image_path.exists():
            cairosvg.svg2png(url=str(f),write_to=str(image_path),output_width=max(8,round(W*2)),output_height=max(8,round(H*2)))
        audit['svg_assets_as_png']+=1
    elif f.suffix.lower() not in ('.png','.jpeg','.jpg','.bmp','.gif','.tif','.tiff'):
        show_unsupported(audit,'media_format',im['path'],slide_num);return True
    if not safe:
        # produce a raster *instance* only when crop requires compositing beyond bounds.
        name=hashlib.sha256((str(f)+str(crop)+str((W,H))).encode()).hexdigest()[:16]+'.png'
        dst=alpha_cache/name
        if not dst.exists():
            from PIL import Image
            source=Image.open(image_path).convert('RGBA')
            scale=2
            src=source.resize((max(1,round(W*scale)),max(1,round(H*scale))),Image.Resampling.LANCZOS)
            canvas=Image.new('RGBA',(max(1,round(w*scale)),max(1,round(h*scale))),(0,0,0,0))
            canvas.paste(src,(round(dx*scale),round(dy*scale)),src)
            canvas.save(dst)
        image_path=dst
        audit['cropped_instance_fallbacks']+=1
        left=right=top=bottom=0
    shape=slide.shapes.add_picture(str(image_path),Pt(x),Pt(y),width=Pt(w),height=Pt(h))
    if safe and crop:
        shape.crop_left=max(0,left);shape.crop_top=max(0,top)
        shape.crop_right=max(0,right);shape.crop_bottom=max(0,bottom)
    if abs(rot)>0.001:shape.rotation=rot%360
    if xf or yf:
        transform=shape._element.spPr.xfrm
        if xf:transform.set('flipH','1')
        if yf:transform.set('flipV','1')
    audit['pictures']+=1
    audit['source_media'].add(str(f.relative_to(base)))
    audit['items'].append({'slide':slide_num,'type':'image','asset':str(f.relative_to(base)),'x':round(x,2),'y':round(y,2),'w':round(w,2),'h':round(h,2),'rotation':round(rot,2),'crop':[round(max(0,i),3) for i in (left,top,right,bottom)]})
    return True


def add_text(slide,child,x,y,rot,audit,slide_num):
    runs=text_runs(child)
    if not runs:return False
    b=re.search(r'box\(\s*width\s*:\s*('+NUM+r')pt\s*,\s*height\s*:\s*('+NUM+r')pt',child)
    if b:w,h=map(float,b.groups())
    else:w=max(150,len(''.join(r['text'] for r in runs))*8);h=max(32,runs[0]['size']*2)
    if w<=0 or h<=0:return True
    shape=slide.shapes.add_textbox(Pt(x),Pt(y),Pt(w),Pt(h))
    tf=shape.text_frame;tf.clear();tf.word_wrap=True
    tf.margin_left=Pt(0);tf.margin_right=Pt(0);tf.margin_top=Pt(0);tf.margin_bottom=Pt(0)
    am=re.search(r'#align\(\s*(center|left|right)',child)
    if am:
        tf.paragraphs[0].alignment={'center':PP_ALIGN.CENTER,'left':PP_ALIGN.LEFT,'right':PP_ALIGN.RIGHT}[am.group(1)]
    txt=''.join(r['text'] for r in runs)
    # Keep rich runs editable. Typst paragraph-height differences are not benchmarked.
    p=tf.paragraphs[0]
    for rr in runs:
        r=p.add_run();r.text=rr['text'];r.font.name=rr['font'];r.font.size=Pt(rr['size']);r.font.bold=rr['bold']
        r.font.color.rgb=RGBColor(*rr['color'])
    if abs(rot)>0.001:shape.rotation=rot%360
    audit['text_boxes']+=1;audit['text_content'].append(txt)
    audit['items'].append({'slide':slide_num,'type':'text','x':round(x,2),'y':round(y,2),'w':round(w,2),'h':round(h,2),'rotation':round(rot,2),'chars':len(txt)})
    return True


def add_native(slide,child,x,y,rot,audit,slide_num):
    for ty in ('rect','circle','ellipse','line'):
        m=re.match(r'#?'+ty+r'\(',child)
        if not m:continue
        a=kwargs(balanced(child,m.end()-1)[0])
        w=length(a.get('width'),100);h=length(a.get('height'),w)
        if ty in ('circle','ellipse'):
            if ty=='circle':w=h=length(a.get('radius'),50)*2 if 'radius' in a else length(a.get('diameter'),100)
            shp=MSO_SHAPE.OVAL
        elif ty=='rect':shp=MSO_SHAPE.RECTANGLE
        else:shp=None
        if shp:
            obj=slide.shapes.add_shape(shp,Pt(x),Pt(y),Pt(w),Pt(h))
            fill=a.get('fill','none')
            if fill=='none':obj.fill.background()
            else:
                obj.fill.solid();obj.fill.fore_color.rgb=RGBColor(*simple_color(fill,(255,255,255)))
            obj.line.fill.background()
        else:
            obj=slide.shapes.add_connector(MSO_CONNECTOR.STRAIGHT,Pt(x),Pt(y),Pt(x+w),Pt(y+h))
        if rot:obj.rotation=rot%360
        audit['native_shapes']+=1
        audit['items'].append({'slide':slide_num,'type':ty,'x':x,'y':y,'w':w,'h':h})
        return True
    return False


def parse_root(raw):
    head=kwargs(raw)
    m=re.search(r'\bchildren\s*:\s*\[',raw)
    if not m:raise ValueError('Root without children')
    content,_=balanced(raw,m.end()-1,'[',']')
    return head,content


def export_one(content,slide,base,cache,audit,n,ox=0.0,oy=0.0,angle=0):
    # Top-level Place calls are consumed as entire nodes, so nested children are
    # not processed again. This preserves local group order and z-order.
    for raw,_,_ in find_calls(content,'Place'):
        a=kwargs(raw);x=ox+length(a.get('x'))+length(a.get('dx'));y=oy+length(a.get('y'))+length(a.get('dy'))
        rot=angle+length(a.get('orientation'));child=a.get('child','')
        group=re.match(r'GroupContent\(',child)
        if group:
            gs=kwargs(balanced(child,group.end()-1)[0]);ch=gs.get('children','')
            if ch.startswith('['):ch=balanced(ch,0,'[',']')[0]
            export_one(ch,slide,base,cache,audit,n,ox=x,oy=y,angle=rot)
            audit['groups_flattened']+=1
            continue
        if add_image(slide,child,base,x,y,rot,cache,audit,n):continue
        if add_text(slide,child,x,y,rot,audit,n):continue
        if add_native(slide,child,x,y,rot,audit,n):continue
        show_unsupported(audit,'child_construct',child,n)


def convert(main,output):
    main=Path(main).resolve();base=main.parent
    content=main.read_text(encoding='utf-8')
    # Generated Typst contains source comments with quotes and parentheses.
    # Strip whole-line comments before structural parsing.
    content=re.sub(r'(?m)^\s*//[^\n]*$', '', content)
    content=normalize_starter_aliases(content)
    slide_calls=list(find_calls(content,'Root'))
    if not slide_calls:raise RuntimeError('No explicit #Root(...) slides; this POC needs Root/Place source')
    first=kwargs(slide_calls[0][0]);sw=length(first.get('width'),960);sh=length(first.get('height'),540)
    if sw<=0 or sh<=0:raise RuntimeError('Invalid logical slide size')
    prs=Presentation();prs.slide_width=Pt(sw);prs.slide_height=Pt(sh)
    cache=output.parent/'raster_cache';cache.mkdir(parents=True,exist_ok=True)
    audit={'scope':'Place-based v8 generated Typst subset, not general Typst','slides':len(slide_calls),'slide_size_pt':[sw,sh],'pictures':0,'text_boxes':0,'native_shapes':0,'groups_flattened':0,'cropped_instance_fallbacks':0,'svg_assets_as_png':0,'text_content':[],'unsupported':[],'source_media':set(),'items':[]}
    for n,(raw,_,_) in enumerate(slide_calls,1):
        head,body=parse_root(raw)
        w=length(head.get('width'),sw);h=length(head.get('height'),sh)
        if (w,h)!=(sw,sh):show_unsupported(audit,'mixed_slide_dimensions',str((w,h)),n)
        slide=prs.slides.add_slide(prs.slide_layouts[6])
        bg=slide.background.fill;bg.solid();bg.fore_color.rgb=RGBColor(*simple_color(head.get('fill'),(255,255,255)))
        export_one(body,slide,base,cache,audit,n)
        audit.setdefault('per_slide',[]).append({'slide':n,'objects':len(slide.shapes)})
    output.parent.mkdir(parents=True,exist_ok=True);prs.save(output)
    audit['unique_source_media']=len(audit['source_media']);audit['source_media']=sorted(audit['source_media'])
    (output.parent/'conversion_report.json').write_text(json.dumps(audit,ensure_ascii=False,indent=2))
    return audit


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('main_typ');p.add_argument('--output',default='converted.pptx');a=p.parse_args()
    report=convert(a.main_typ,Path(a.output).resolve())
    print(json.dumps({k:v for k,v in report.items() if k in ('slides','pictures','text_boxes','native_shapes','groups_flattened','unique_source_media','cropped_instance_fallbacks','svg_assets_as_png')},indent=2))
if __name__=='__main__':main()
