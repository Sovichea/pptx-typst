"""Source-driven DrawingML geometry helpers. Normalized paths for vector artwork and
picture masks. Does not invent gradients or replace original transparent images.
"""
from __future__ import annotations
import math
from lxml import etree

def kind_and_paths(element):
    preset=element.xpath('./p:spPr/a:prstGeom')
    custom=element.xpath('./p:spPr/a:custGeom/a:pathLst/a:path')
    if custom:return 'custom',custom
    if preset:return preset[0].get('prst','rect'),[]
    return 'rect',[]

def _svg_custom(path):
    w=float(path.get('w','21600'));h=float(path.get('h','21600'))
    w=max(w,1.);h=max(h,1.)
    def xy(pt):return float(pt.get('x',0))/w,float(pt.get('y',0))/h
    cmds=[];cur=(0.,0.);start=(0.,0.)
    for op in path:
        name=etree.QName(op).localname
        pts=op.findall('{http://schemas.openxmlformats.org/drawingml/2006/main}pt')
        if name in ('moveTo','lnTo') and pts:
            cur=xy(pts[0]);
            if name=='moveTo':start=cur
            cmds.append(f'{"M" if name=="moveTo" else "L"}{cur[0]:.8f},{cur[1]:.8f}')
        elif name=='cubicBezTo' and len(pts)==3:
            coords=[xy(p) for p in pts];cur=coords[-1]
            cmds.append('C'+' '.join(f'{a:.8f},{b:.8f}' for a,b in coords))
        elif name=='quadBezTo' and len(pts)==2:
            coords=[xy(p) for p in pts];cur=coords[-1]
            cmds.append('Q'+' '.join(f'{a:.8f},{b:.8f}' for a,b in coords))
        elif name=='arcTo':
            # DrawingML arcTo starts at current point and follows an unrotated ellipse.
            rx=float(op.get('wR','0'))/w;ry=float(op.get('hR','0'))/h
            sa=math.radians(float(op.get('stAng','0'))/60000)
            sw=math.radians(float(op.get('swAng','0'))/60000)
            if rx <= 0 or ry<=0:continue
            cx=cur[0]-rx*math.cos(sa);cy=cur[1]-ry*math.sin(sa)
            end=(cx+rx*math.cos(sa+sw),cy+ry*math.sin(sa+sw))
            large=1 if abs(sw)>math.pi else 0;sweep=1 if sw>=0 else 0
            cmds.append(f'A{rx:.8f},{ry:.8f} 0 {large} {sweep} {end[0]:.8f},{end[1]:.8f}')
            cur=end
        elif name=='close':cmds.append('Z');cur=start
    return ' '.join(cmds)

def _preset_path(preset):
    # Fixed-guide common presets. Adjustable guides require resolved OOXML geometry.
    pts={
       'triangle': [(0.5,0),(1,1),(0,1)],
       'rtTriangle': [(0,0),(1,1),(0,1)],
       'diamond':[(.5,0),(1,.5),(.5,1),(0,.5)],
       'hexagon':[(.25,0),(.75,0),(1,.5),(.75,1),(.25,1),(0,.5)],
       'pentagon':[(.5,0),(.976,.345),(.794,.905),(.206,.905),(.024,.345)],
       'trapezoid':[(.25,0),(.75,0),(1,1),(0,1)],
       'parallelogram':[(.22,0),(1,0),(.78,1),(0,1)],
       'chevron':[(0,0),(.68,0),(1,.5),(.68,1),(0,1),(.32,.5)],
       'homePlate':[(0,0),(.75,0),(1,.5),(.75,1),(0,1)],
       'snip1Rect':[(.13,0),(1,0),(1,1),(0,1),(0,.13)],
       'snip2SameRect':[(.12,0),(.88,0),(1,.12),(1,1),(0,1),(0,.12)],
       'snip2DiagRect':[(.12,0),(1,0),(1,1),(.0,1),(.0,.12)],
       'plaque':[(.12,0),(.88,0),(1,.12),(1,.88),(.88,1),(.12,1),(0,.88),(0,.12)],
       'flowChartDecision':[(.5,0),(1,.5),(.5,1),(0,.5)],
       'flowChartData':[(.15,0),(1,0),(.85,1),(0,1)],
       'pie':[(.5,.5),(1,.5),(.5,1)],
    }
    if preset in ('rect','roundRect'):
        return 'M0,0 H1 V1 H0 Z' if preset=='rect' else 'M.1,0 H.9 Q1,0 1,.1 V.9 Q1,1 .9,1 H.1 Q0,1 0,.9 V.1 Q0,0 .1,0 Z'
    if preset=='ellipse':
        return 'M1,.5 A.5,.5 0 1 1 0,.5 A.5,.5 0 1 1 1,.5 Z'
    if preset in ('line','straightConnector1'):
        return 'M0,0 L1,1'
    if preset=='arc':return 'M0,.5 A.5,.5 0 0 1 .5,0'
    if preset in pts:
        return ' '.join(('M' if i==0 else 'L')+f'{a:.8f},{b:.8f}' for i,(a,b) in enumerate(pts[preset]))+' Z'
    return None

def shape_paths(element):
    kind,xml_paths=kind_and_paths(element)
    if xml_paths:
        paths=[_svg_custom(p) for p in xml_paths]
        return kind,[p for p in paths if p]
    p=_preset_path(kind)
    return kind,[p] if p else []
