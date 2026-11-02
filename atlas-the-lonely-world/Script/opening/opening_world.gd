extends "res://Script/prototype/connected_r01.gd"
const SURFACE = preload("res://Script/opening/reactive_surface.gd")
const COOP = preload("res://Script/opening/cooperation.gd")
const MOSS = preload("res://Script/campaign/moss.gd")
const SAVE_STATE = preload("res://Script/opening/journey_save.gd")
var moss: CharacterBody2D
var hazards: Dictionary = {}
var puzzles: Dictionary = {}
var flags: Dictionary = {}
var restore_data: Dictionary = {}
var save_path: String = SAVE_STATE.PATH
var intro_time := 0.0
var intro_active := true
var intro_canvas: CanvasLayer
var intro_label: Label
var paper: Polygon2D
var last_region := -1
var cp_id := "A01_DOOR"
var survey_state := 0
var finished := false
var nav: Array = []
var checkpoints := [Vector3(3950,640,0),Vector3(4500,610,1),Vector3(8100,640,2),Vector3(11100,640,3),Vector3(13900,640,4),Vector3(15600,640,5),Vector3(16850,700,6),Vector3(19500,640,7),Vector3(22200,700,8),Vector3(23100,670,9),Vector3(24900,700,10),Vector3(27700,780,11)]

func _ready() -> void:
	chunk_count=7
	menu_path="res://Scene/opening/main.tscn"
	super._ready()
	# Build anchors from the native terrain collision surfaces, not unrelated world samples.
	for chunk in get_children():
		if chunk is Node2D and chunk!=okto:
			for body in chunk.get_children():
				if body.has_node("TopEdge"):
					var pts: PackedVector2Array=body.get_node("TopEdge").points
					for i in range(pts.size()-1):
						var distance: float=pts[i].distance_to(pts[i+1])
						for k in range(maxi(1,ceili(distance/60))):
							var pt: Vector2=pts[i].lerp(pts[i+1],float(k)/maxi(1,ceili(distance/60)))+chunk.position
							if pt.x>=16000:
								nav.append(pt)
	add_hazard("A02_BRITTLE",Vector2(5200,550),55,1.25,60)
	add_hazard("A03_MASONRY",Vector2(10200,700),55,1.0,50)
	add_hazard("A04_SLAB",Vector2(14880,640),190,1.5,90)
	add_hazard("A05_STORY",Vector2(16300,640),120,1.0,80)
	add_hazard("A05_CATWALK",Vector2(18020,670),190,1.8,30)
	add_hazard("A07_WET",Vector2(26400,700),60,1.15,60)
	for entry in [["A05",Vector2(17200,700)],["A06",Vector2(21500,700)]]:
		var puzzle=COOP.new()
		puzzle.puzzle_id=entry[0]
		puzzle.position=entry[1]
		puzzle.actor=okto
		add_child(puzzle)
		puzzle.milestone.connect(on_puzzle)
		puzzles[entry[0]]=puzzle
	build_intro()
	if not restore_data.is_empty():
		restore_snapshot(restore_data)
	else:
		okto.set_physics_process(false)

func add_hazard(id: String, at: Vector2, span: float, warning: float, drop: float) -> void:
	var surface=SURFACE.new()
	surface.position=at
	surface.surface_id=id
	surface.span=span
	surface.warning_duration=warning
	surface.settle_drop=drop
	surface.actor=okto
	add_child(surface)
	surface.state_changed.connect(on_surface)
	hazards[id]=surface

func build_intro() -> void:
	intro_canvas=CanvasLayer.new()
	intro_canvas.layer=30
	add_child(intro_canvas)
	var backdrop:=ColorRect.new()
	backdrop.color=Color(.10,.14,.16,.96)
	backdrop.size=Vector2(1920,1080)
	intro_canvas.add_child(backdrop)
	var board:=Node2D.new()
	intro_canvas.add_child(board)
	# Empty chair, unused workbench, tools and an unfolding paper are visual story placeholders.
	for rect in [Rect2(500,690,920,24),Rect2(550,714,25,160),Rect2(1350,714,25,160),Rect2(370,620,90,20),Rect2(370,510,15,180),Rect2(385,640,15,150),Rect2(590,670,180,8)]:
		var p:=Polygon2D.new()
		p.polygon=PackedVector2Array([rect.position,Vector2(rect.end.x,rect.position.y),rect.end,Vector2(rect.position.x,rect.end.y)])
		p.color=Color("806e57")
		board.add_child(p)
	paper=Polygon2D.new()
	paper.position=Vector2(960,585)
	paper.polygon=PackedVector2Array([Vector2(-180,-100),Vector2(180,-100),Vector2(180,100),Vector2(-180,100)])
	paper.color=Color("d7c99c")
	board.add_child(paper)
	var ink:=Line2D.new()
	ink.points=PackedVector2Array([Vector2(-140,50),Vector2(-100,10),Vector2(-40,25),Vector2(20,-40),Vector2(80,-35),Vector2(115,-70)])
	ink.width=3
	ink.default_color=Color("5a6556")
	paper.add_child(ink)
	intro_label=Label.new()
	intro_label.position=Vector2(600,830)
	intro_label.add_theme_font_size_override("font_size",28)
	intro_canvas.add_child(intro_label)

func _physics_process(delta: float) -> void:
	if intro_active:
		intro_time+=delta
		paper.scale.x=lerpf(.04,1.0,smoothstep(4,10,intro_time))
		intro_label.text="The valley wakes." if intro_time<4 else ("An unfinished map, among his father's belongings." if intro_time<10 else "Beyond the familiar edge, a line remains unfinished.")
		if intro_time>=16:
			intro_active=false
			intro_canvas.hide()
			flags["opening_seen"]=true
			okto.set_physics_process(true)
			write_checkpoint()
		return
	super._physics_process(delta)
	var region:=clampi(int(okto.position.x/4000),0,6)
	if region!=last_region:
		last_region=region
		if region>=3:
			title.text=["Crossing Rim","Fallen Span","Shared Bridgeworks","Downstream Descent"][region-3]
			title.modulate.a=1
			elapsed=0
			if not journal.has(title.text):
				journal.append(title.text)
	if region>=3:
		title.modulate.a=clampf(5-elapsed,0,1)
	if okto.position.x>6100 and survey_state==0:
		survey_state=1
	if Input.is_action_just_pressed("atlas_survey") and absf(okto.position.x-6250)<110:
		survey_state=maxi(survey_state,2)
	if okto.position.x>7350 and survey_state<3:
		survey_state=3
		journal.append("A narrow fracture behind the aligned rocks.")
	if moss==null and okto.position.x>16430 and okto.position.y>680:
		spawn_moss(Vector2(16900,698))
		flags["first_sight"]=true
		journal.append("A wary small creature in the fallen chamber.")
		frame_vista(3.2)
		write_checkpoint()
	for value in puzzles.values():
		value.companion=moss
		if not value.prompt.is_empty():
			prompt.text=value.prompt
	if moss!=null and puzzles.A05.stage<1 and okto.position.x<17200:
		moss.cooperating=true
		moss.goal=Vector2(17000,700)
	if okto.position.x>18020 and puzzles.A05.stage>=2 and not flags.get("rescue_started",false):
		flags["rescue_started"]=true
		hazards.A05_CATWALK.trigger()
	for cp in checkpoints:
		var id:="CP_%02d" % int(cp.z)
		if absf(okto.position.x-cp.x)<40 and absf(okto.position.y-cp.y)<8 and okto.is_on_floor() and cp_id!=id:
			checkpoint=Vector2(cp.x,cp.y-2)
			cp_id=id
			write_checkpoint()
	if okto.position.y>1020 or Input.is_action_just_pressed("okto_reset") or (moss!=null and moss.position.y>1020):
		restore_snapshot(snapshot())
	if okto.position.x>27100 and moss!=null and not flags.get("aqueduct_seen",false):
		flags["aqueduct_seen"]=true
		frame_vista(2.5)
		journal.append("Aqueduct terraces beyond the downstream mist.")
	if okto.position.x>27700 and moss!=null and moss.position.x>27500:
		finished=true
		prompt.text="The Aqueduct lies ahead. Opening journey complete."
		if not flags.get("complete",false):
			flags["complete"]=true
			write_checkpoint()
	if okto.position.x>11700 and okto.position.x<12000:
		prompt.text=""

func spawn_moss(at: Vector2) -> void:
	moss=MOSS.new()
	moss.position=at
	moss.player=okto
	add_child(moss)
	moss.set_navigation(nav)

func on_surface(id: String, state: int) -> void:
	if state==SURFACE.State.SETTLED:
		flags[id]=true
		write_checkpoint()

func on_puzzle(id: String, stage: int) -> void:
	flags[id+"_stage"]=stage
	if id=="A05" and stage==4:
		journal.append("A way out, made together.")
	write_checkpoint()

func snapshot() -> Dictionary:
	return {"schema":2,"checkpoint":cp_id,"x":checkpoint.x,"y":checkpoint.y,"moss":moss!=null,"flags":flags.duplicate(true),"journal":journal.duplicate(),"survey":survey_state,"puzzles":{"A05":puzzles.A05.stage,"A06":puzzles.A06.stage}}

func write_checkpoint() -> void:
	var error:=SAVE_STATE.write(snapshot(),save_path)
	if error!=OK:
		push_error("Could not save opening checkpoint: %s" % error)

func restore_snapshot(data: Dictionary) -> void:
	if data.is_empty():
		return
	intro_active=false
	intro_canvas.hide()
	flags=data.get("flags",{}).duplicate(true)
	journal.assign(data.get("journal",[]))
	survey_state=int(data.get("survey",0))
	cp_id=str(data.get("checkpoint","A01_DOOR"))
	checkpoint=Vector2(float(data.get("x",110)),float(data.get("y",638)))
	okto.spawn_position=checkpoint
	okto.reset_to_spawn()
	okto.set_physics_process(true)
	if bool(data.get("moss",false)):
		if moss==null:
			spawn_moss(checkpoint-Vector2(45,0))
		moss.position=checkpoint-Vector2(45,0)
		moss.velocity=Vector2.ZERO
		moss.route.clear()
	for id in hazards:
		if bool(flags.get(id,false)):
			hazards[id].restore_settled()
	for id in puzzles:
		puzzles[id].stage=int(data.get("puzzles",{}).get(id,0))
		puzzles[id].apply_state()
