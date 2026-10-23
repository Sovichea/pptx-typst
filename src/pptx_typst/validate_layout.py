#!/usr/bin/env python3
"""Object geometry and source-asset audit, independent of font glyph rendering.
Source boxes/rotations and media relationships are verified against the
conversion manifest. This is NOT a pixel similarity test.
"""
from __future__ import annotations
import argparse,hashlib,json,math
from pathlib import Path
from pptx import Presentation
from pptx.enum.shapes import MSO_SHAPE_TYPE
from pptx.oxml.ns import qn
EMU=12700
p=argparse.ArgumentParser()
p.add_argument('pptx',type=Path);p.add_argument('project',type=Path);p.add_argument('--out',type=Path)
a=p.parse_args();prs=Presentation(a.pptx)
m=json.loads((a.project/'asset_manifest.json').read_text())
all_issues=[];results=[];total=0;matched=0;images=0;hash_verified=0;bad_bounds=0;geometry_unavailable=0;pos_errors=[];rot_errors=[]
for n,slide in enumerate(prs.slides,1):
 rec=m['slides'][n-1]; byid={int(v['source_shape_id']):v for v in rec['placements'] if not v['group_path']}
 zorder={int(v['source_shape_id']):v.get('z_index') for v in rec['placements'] if not v['group_path']}
 err=[]
 for i,sh in enumerate(slide.shapes):
  if sh.shape_type==MSO_SHAPE_TYPE.GROUP:continue
  img=sh._element.xpath('./p:spPr/a:blipFill/a:blip') or sh._element.xpath('./p:blipFill/a:blip')
  v=byid.get(sh.shape_id)
  if not v:
   err.append({'shape':sh.shape_id,'issue':'missing ungrouped source object'});continue
  matched+=1;total+=1
  if zorder.get(sh.shape_id)!=i:
   err.append({'shape':sh.shape_id,'issue':'source z-order mismatch'})
  if any(value is None for value in (sh.left,sh.top,sh.width,sh.height)):
   geometry_unavailable+=1
   err.append({'shape':sh.shape_id,'issue':'source geometry unavailable; position and size cannot be compared'})
   continue
  sw,shh=sh.width/EMU,sh.height/EMU
  scx,scy=(sh.left+sh.width/2)/EMU,(sh.top+sh.height/2)/EMU
  dcx,dcy=v['x']+v['w']/2,v['y']+v['h']/2
  center_error=math.hypot(dcx-scx,dcy-scy)
  pos_errors.append(center_error)
  if center_error>.2:err.append({'shape':sh.shape_id,'issue':'center difference >0.2 pt','pt':round(center_error,4)})
  werr=abs(v['w']-sw);herr=abs(v['h']-shh)
  if max(werr,herr)>.2:err.append({'shape':sh.shape_id,'issue':'size mismatch','width_pt':werr,'height_pt':herr})
  if v['w']<0 or v['h']<0:bad_bounds+=1
  if img:
   images+=1
   rid=img[0].get(qn('r:embed'))
   if rid:
    source_hash=hashlib.sha256(sh.part.related_part(rid).blob).hexdigest()
    original=a.project/v['source'] if 'source' in v else None
    if original is not None and original.exists() and hashlib.sha256(original.read_bytes()).hexdigest()==source_hash:
     hash_verified+=1
    else:err.append({'shape':sh.shape_id,'issue':'source image changed or missing'})
  xfrm=sh._element.xpath('./p:spPr/a:xfrm')
  horizontal_flip=bool(xfrm and xfrm[0].get('flipH') in ('1','true'))
  expected_angle=float(sh.rotation)+(180 if horizontal_flip else 0)
  rot_errors.append(abs((v['rot']-expected_angle+180)%360-180))
 results.append({'slide':n,'ungrouped_source_objects':sum(sh.shape_type!=MSO_SHAPE_TYPE.GROUP for sh in slide.shapes),'verified':len(byid),'issues':err})
 all_issues+=err
summary={'slides':len(prs.slides),'source_ungrouped_objects_verified':matched,'source_objects_without_geometry':geometry_unavailable,'source_image_occurrences':images,'original_image_hashes_verified':hash_verified,'object_center_mean_error_pt':sum(pos_errors)/len(pos_errors) if pos_errors else None,'object_center_max_error_pt':max(pos_errors) if pos_errors else None,'object_rotation_max_error_deg':max(rot_errors) if rot_errors else None,'negative_bounds':bad_bounds,'z_order_and_shape_issues':len(all_issues),'unique_media_assets':m['unique_images'],'group_count':m['counts'].get('group',0),'groups_recorded':sum(len(s['groups']) for s in m['slides']),'note':'Ungrouped objects only: grouped objects require hierarchical affine validation, and text visual metrics are intentionally excluded. Objects without source geometry are reported and excluded from position and size comparisons.'}
record={'summary':summary,'slides':results}
if a.out:a.out.write_text(json.dumps(record,indent=2))
print(json.dumps(summary,indent=2))
