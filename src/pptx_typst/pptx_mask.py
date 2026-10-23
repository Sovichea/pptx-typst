"""Transparent clipped derivative producer. Original media always extracted once.
Derivatives are only created for genuinely nonrectangular picture masks.
"""
from pathlib import Path
import hashlib,io,json,math
from PIL import Image

def mask_image(data:bytes, width_pt:float,height_pt:float,paths:list[str],crop,fillrect,alpha:float,asset_dir:Path, source_hash:str):
    key=("v8-cover-full-viewbox",source_hash,round(width_pt,3),round(height_pt,3),tuple(paths),crop,fillrect,round(alpha,5))
    tag=hashlib.sha256(repr(key).encode()).hexdigest()[:16]
    dest=asset_dir/f'clip_{tag}.png'
    if dest.exists():
        try:
            with Image.open(dest) as previous:previous.verify()
            return 'assets/media/'+dest.name
        except Exception:
            dest.unlink(missing_ok=True)

    try:
        src=Image.open(io.BytesIO(data)).convert('RGBA')
    except Exception:return None
    # capped output scale while retaining high fidelity for projected slides
    scale=min(2.5,2400/max(width_pt,height_pt,1))
    W=max(2,round(width_pt*scale));H=max(2,round(height_pt*scale))
    cr=crop or {k:0 for k in ('l','t','r','b')}
    fr=fillrect or {k:0 for k in ('l','t','r','b')}
    l,t,r,b=(fr[k] for k in ('l','t','r','b'))
    cl,ct,c_right,cb=(cr[k] for k in ('l','t','r','b'))
    dw=(1-l-r);dh=(1-t-b);sx=(1-cl-c_right);sy=(1-ct-cb)
    if min(dw,dh,sx,sy)<=.001:return None
    # PIL AFFINE is OUTPUT -> INPUT pixels. Reproduce PowerPoint source cropping
    # and picture fillRect before shape-based alpha clipping.
    aw=src.width*sx/(W*dw);bw=src.width*(cl-l*sx/dw)
    ah=src.height*sy/(H*dh);bh=src.height*(ct-t*sy/dh)
    frame=src.transform((W,H),Image.Transform.AFFINE,(aw,0,bw,0,ah,bh),resample=Image.Resampling.BICUBIC,fillcolor=(0,0,0,0))
    # Important: Office stretches normalized geometry to the entire shape rectangle.
    # SVG defaults to xMidYMid meet, which incorrectly inscribes a square mask
    # inside non-square pictures. preserveAspectRatio=none restores the authored
    # ellipse/rounded-rectangle proportions before group rotation is applied.
    path_svg=''.join(f'<path d="{p}" fill="white"/>' for p in paths)
    svg=f'<svg xmlns="http://www.w3.org/2000/svg" width="{W}" height="{H}" viewBox="0 0 1 1" preserveAspectRatio="none">{path_svg}</svg>'
    try:
        import cairosvg
        bytes_png=cairosvg.svg2png(bytestring=svg.encode(),output_width=W,output_height=H)
    except Exception:return None
    coverage=Image.open(io.BytesIO(bytes_png)).convert('RGBA').getchannel('A')
    import PIL.ImageChops
    image_alpha=frame.getchannel('A')
    if alpha<.999:image_alpha=image_alpha.point(lambda x:round(x*alpha))
    frame.putalpha(PIL.ImageChops.multiply(image_alpha,coverage))
    staged=dest.with_name(dest.stem+'.writing.png')
    frame.save(staged,optimize=True)
    staged.replace(dest)
    return 'assets/media/'+dest.name
