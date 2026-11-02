"""Native editable collision geometry: right ascent, left descent, right cave."""
from pathlib import Path
root=Path(__file__).resolve().parents[1]/'Scene/nomad'
lines=['[gd_scene format=3]','[node name="NomadTerrain" type="Node2D"]']
def pts(v):return ', '.join(str(n) for p in v for n in p)
def poly(name,v,col,solid=False,oneway=False):
 if name.startswith(('Cave_','Roof_','Broken_Bridge','Bridge_Pier','Boundary_R02')):v=[(x,y+160) for x,y in v]
 lines.append(f'[node name="{name}" type="'+('StaticBody2D' if solid else 'Node2D')+'" parent="."'+(' groups=["grabbable"]' if name in ['A01_Village_Ascent_7','A02_Ascent_After_Brittle_5'] else '')+']')
 if solid:
  lines.extend(['collision_layer = 2','collision_mask = 0',f'[node name="Collision" type="CollisionPolygon2D" parent="{name}"]',f'polygon = PackedVector2Array({pts(v)})']+(['one_way_collision = true'] if oneway else []))
 lines.extend([f'[node name="Visual" type="Polygon2D" parent="{name}"]',f'polygon = PackedVector2Array({pts(v)})',f'color = Color({col})'])
 if solid:
  lines.extend([f'[node name="Edge" type="Line2D" parent="{name}"]',f'points = PackedVector2Array({pts(v[:2])})','width = 2.0','default_color = Color(0.78,0.81,0.69,1)'])
def slab(name,top,thick=32):
 for i,(a,b) in enumerate(zip(top,top[1:])):
  if a[0]==b[0]:continue
  poly(name+'_'+str(i),[a,b,(b[0],b[1]+thick),(a[0],a[1]+thick)],'0.38,0.43,0.39,1',True)
def box(name,x,y,w,h,color='0.33,0.37,0.37,1',solid=False):poly(name,[(x,y),(x+w,y),(x+w,y+h),(x,y+h)],color,solid)
box('Mountains',-100,-100,6600,1600,'0.15,0.22,0.24,1')
for i,(x,h) in enumerate([(0,600),(700,650),(1500,500),(2400,450),(3200,200),(4000,80),(4800,100)]):
 poly('Mountain_%d'%i,[(x-400,1300),(x,h),(x+250,h-160),(x+700,1300)],'0.20,0.28,0.29,1')
# Independent upper and lower collision ribbons preserve the real physical switchback.
upper=[(0,1200),(500,1200),(750,1170),(1000,1170),(1000,1140),(1300,1140),(1550,1090),(1550,1028),(1800,1028),(2100,980),(2150,980),(2150,952),(2300,952),(2400,900),(2700,820),(2750,820),(2750,788),(2850,788),(2950,760),(2950,730),(3200,650),(3400,610),(3500,610)]
slab('A01_Village_Ascent',upper)
slab('A02_Ascent_Before_Brittle',[(3500,610),(3600,580),(3700,550)])
slab('A02_Ascent_After_Brittle',[(3755,550),(3950,520),(4200,440),(4400,380),(4500,380),(4500,350),(4700,300),(4780,300)])
slab('A02_Brittle_Recovery',[(3650,620),(3780,620),(3870,580)])
poly('Fracture_Overhang',[(3930,428),(4150,358),(4150,378),(3930,448)],'0.31,0.37,0.36,1',True)
# Right edge ends at the crest: the visible next shelf is below and to the left.
slab('A03_Leftward_Switchback',[(2750,960),(2900,960),(3100,910),(3300,860),(3500,800),(3750,740),(4000,660),(4200,590),(4400,510),(4600,460),(4850,400)])
# Block a blind step beyond the crest without placing a world-space wall at the cave exit.
box('Crest_Rock_Stop',4860,140,90,240,'0.28,0.34,0.34,1',True)
slab('Mouth_Approach',[(2600,1020),(2750,1020)],20)
slab('Cave_Floor_Left',[(2450,960),(3450,960)])
slab('Cave_Floor_Right',[(3505,960),(5300,960),(5500,960),(6200,960)],60)
slab('Cave_Masonry_Recovery',[(3400,1020),(3560,1020),(3660,990)])
box('Roof_Stand',2900,862,500,18,solid=True)
box('Roof_Crouch',3400,900,500,20,solid=True)
box('Roof_Crawl',3900,918,600,18,solid=True)
box('Roof_Crouch_Exit',4500,900,500,20,solid=True)
box('Roof_Stand_Exit',5000,842,400,38,solid=True)
for i,(x,y,w) in enumerate([(900,1100,130),(1100,1070,150),(1300,1070,140),(1450,1090,110),(3120,610,120),(3300,580,120),(3450,580,140),(4100,380,150),(4250,350,160)]):
 poly('Optional_%d'%i,[(x,y),(x+w,y),(x+w,y+16),(x,y+16)],'0.49,0.45,0.34,1',True,True)
for i,(x,y) in enumerate([(50,1200),(420,1200),(920,1170)]):
 box('House_%d'%i,x,y-130,110,130,'0.49,0.40,0.31,1');box('Door_%d'%i,x+40,y-60,25,60,'0.16,0.22,0.23,1');box('Cloth_%d'%i,x-8,y-140,126,18,'0.61,0.51,0.36,1')
for i,(x,y) in enumerate([(600,1188),(1250,1130),(1700,1050)]):box('Resident_%d'%i,x,y-28,12,28,'0.64,0.56,0.42,1')
poly('Split_Crown',[(3300,650),(3300,510),(3330,480),(3340,530),(3360,480),(3390,520),(3390,650)],'0.46,0.51,0.44,1')
poly('Leaning_Needle',[(3600,585),(3645,430),(3670,435),(3640,585)],'0.47,0.52,0.45,1')
poly('Witness_Stone',[(3830,550),(3840,440),(3890,430),(3920,470),(3910,550)],'0.45,0.49,0.44,1')
# Far exterior remains occluded by the cave roof and composition until x > 5400.
box('Broken_Bridge_Far',5680,740,260,35,'0.33,0.40,0.41,1');box('Bridge_Pier',5940,680,45,250,'0.32,0.39,0.40,1')
box('Left_Wall',-30,0,30,1500,solid=True);box('Boundary_R02',6190,850,20,200,solid=True)
(root/'terrain.tscn').write_text('\n\n'.join(lines)+'\n',encoding='utf-8')

