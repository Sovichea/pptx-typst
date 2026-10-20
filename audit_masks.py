#!/usr/bin/env python3
"""Reference-guided validation of picture-mask placements.

A mask is enabled only if testing that specific source shape against a PPTX
reference render improves its local appearance without a material slide-level
regression. This does NOT substitute a new raster illustration for the original:
media assets are shared and the alpha-mask derivative is cached separately.
"""
from __future__ import annotations
import argparse,json,subprocess,tempfile,sys
from pathlib import Path
import numpy as np,fitz
from skimage.metrics import structural_similarity as ssim
p=argparse.ArgumentParser()
p.add_argument('pptx',type=Path)
p.add_argument('--reference-pdf',type=Path,required=True)
p.add_argument('--output',type=Path,default=Path('audited'))
p.add_argument('--typst',type=Path,required=True)
p.add_argument('--min-local-gain',type=float,default=.002)
p.add_argument('--max-slide-loss',type=float,default=.0005)
p.add_argument('--max-candidates',type=int,default=30)
p.add_argument('--render-width',type=int,default=640)
a=p.parse_args();BASE=Path(__file__).resolve().parent;out=a.output.resolve();out.mkdir(parents=True,exist_ok=True)
refpdf=fitz.open(a.reference_pdf);src=a.pptx.resolve()

def render(doc):
    result=[]
    for page in doc:
        sc=a.render_width/page.rect.width
        px=page.get_pixmap(matrix=fitz.Matrix(sc,sc),alpha=False)
        result.append(np.frombuffer(px.samples,dtype=np.uint8).reshape((px.height,px.width,3)).copy())
    return result
ref=render(refpdf)

def build(tag,pairs):
    project=out/tag;project.mkdir(parents=True,exist_ok=True)
    allow=project/'allowlist.json';allow.write_text(json.dumps({'placements':[{'slide':i,'shape_id':j} for i,j in pairs]},indent=2))
    cmd=[sys.executable,str(BASE/'pptx_to_typst.py'),str(src),'--output',str(project),'--mask-mode','experimental','--mask-allowlist',str(allow)]
    cr=subprocess.run(cmd,capture_output=True,text=True)
    if cr.returncode:raise RuntimeError(f'converter failure {tag}: '+cr.stderr[-2000:])
    co=subprocess.run([str(a.typst),'compile',str(project/'main.typ'),str(project/'converted.pdf')],capture_output=True,text=True)
    if co.returncode:raise RuntimeError(f'Typst compile failure {tag}: '+co.stderr[-2000:])
    m=json.loads((project/'asset_manifest.json').read_text());frames=render(fitz.open(project/'converted.pdf'))
    if len(frames)!=len(ref):raise RuntimeError('mismatched page counts')
    return project,m,frames

baseline,m0,baseframes=build('baseline',[])
candidates=[]
for page in m0['slides']:
    for item in page['placements']:
        if item.get('type')!='image' or item.get('geometry')=='rect':continue
        if item.get('group_path'):continue  # audit can add grouped support after affine validation
        candidates.append((page['slide'],item['source_shape_id'],item))
selected=[];results=[];currentframes=baseframes
for i,(slide,shape,item) in enumerate(candidates[:a.max_candidates],1):
    tag=f'trial_{i:03d}';proposal=selected+[(slide,shape)]
    proj,manifest,frames=build(tag,proposal)
    it=next((v for v in manifest['slides'][slide-1]['placements'] if v['source_shape_id']==shape and v.get('type')=='image'),None)
    if not it or not it.get('mask_applied'):
        results.append({'slide':slide,'shape_id':shape,'geometry':item.get('geometry'),'selected':False,'reason':'mask not supported by experimental generator'});continue
    s=slide-1
    w,h=ref[s].shape[1],ref[s].shape[0]
    base=currentframes[s];new=frames[s];real=ref[s]
    # Shape bounding area expanded by 20 px. Rotated bbox uses object full diagonal
    pw,ph=m0['slide_dimensions_pt'];rx=w/pw;ry=h/ph
    xx,yy,ww,hh=item['x'],item['y'],item['w'],item['h'];angle=np.radians(item['rot'])
    bbw=abs(ww*np.cos(angle))+abs(hh*np.sin(angle));bbh=abs(hh*np.cos(angle))+abs(ww*np.sin(angle))
    cx=xx+ww/2;cy=yy+hh/2
    x0=max(0,int((cx-bbw/2)*rx)-18);x1=min(w,int((cx+bbw/2)*rx)+18)
    y0=max(0,int((cy-bbh/2)*ry)-18);y1=min(h,int((cy+bbh/2)*ry)+18)
    if x1-x0<24 or y1-y0<24:continue
    slicer=np.s_[y0:y1,x0:x1,:]
    lb=ssim(real[slicer],base[slicer],channel_axis=2,data_range=255)
    ln=ssim(real[slicer],new[slicer],channel_axis=2,data_range=255)
    sb=ssim(real,base,channel_axis=2,data_range=255)
    sn=ssim(real,new,channel_axis=2,data_range=255)
    accept=bool((ln-lb>=a.min_local_gain) and (sn-sb>=-a.max_slide_loss))
    if accept:selected=proposal;currentframes=frames
    results.append({'slide':slide,'shape_id':shape,'name':item.get('name'),'geometry':item.get('geometry'),'selected':accept,'local_ssim_before':round(lb,6),'local_ssim_after':round(ln,6),'local_gain':round(ln-lb,6),'slide_gain':round(sn-sb,6),'reason':'accepted by visual reference' if accept else 'no dependable gain'})
    print(f'slide {slide} shape {shape}: local {ln-lb:+.4f} full {sn-sb:+.4f} {"SELECT" if accept else "SKIP"}',flush=True)
final,finalmanifest,finalframes=build('selected',selected)
mean_before=float(np.mean([ssim(r,b,channel_axis=2,data_range=255) for r,b in zip(ref,baseframes)]))
mean_after=float(np.mean([ssim(r,b,channel_axis=2,data_range=255) for r,b in zip(ref,finalframes)]))
result={'candidates_considered':len(results),'selected':len(selected),'selected_placements':[{'slide':i,'shape_id':j} for i,j in selected],'mean_slide_ssim_before':round(mean_before,6),'mean_slide_ssim_after':round(mean_after,6),'results':results,'note':'Uses LibreOffice-rendered PPTX as visual reference. No source media changed. SSIM includes text and is secondary to geometry checks.'}
(out/'audit.json').write_text(json.dumps(result,indent=2));print(json.dumps({k:v for k,v in result.items() if k not in ('results','selected_placements')},indent=2))
