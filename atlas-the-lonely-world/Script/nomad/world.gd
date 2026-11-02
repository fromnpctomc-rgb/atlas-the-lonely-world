extends Node2D
const OKTO=preload("res://Scene/characters/okto.tscn")
const PLAYER=preload("res://Script/nomad/player.gd")
const HAZARD=preload("res://Script/opening/reactive_surface.gd")
const SAVE=preload("res://Script/opening/journey_save.gd")
var restore_data: Dictionary={}
var save_path: String="user://atlas_nomad_v3.json"
var okto: CharacterBody2D
var phase:=0
var survey:=0
var journal: Array[String]=[]
var flags: Dictionary={}
var checkpoint:=Vector2(110,1198)
var checkpoint_phase:=0
var elapsed:=0.0
var intro:=3.0
var reveal_tween: Tween
var prompt: Label
var debug: Label
var map_label: Label
var hazards: Dictionary={}
var completed:=false
var show_topology:=false
var map_open:=false

func _ready() -> void:
	RenderingServer.set_default_clear_color(Color("233337"))
	okto=OKTO.instantiate()
	okto.set_script(PLAYER)
	okto.position=checkpoint
	okto.spawn_position=checkpoint
	okto.set_meta("campaign",true)
	add_child(okto)
	var camera: Camera2D=okto.get_node("Camera2D")
	camera.zoom=Vector2.ONE*4
	camera.limit_left=0
	camera.limit_right=5400
	camera.limit_top=-100
	camera.limit_bottom=1450
	add_hazard("brittle",Vector2(3700,550),55,1.25,70)
	add_hazard("masonry",Vector2(3450,1120),55,1.2,60)
	var canvas:=CanvasLayer.new()
	add_child(canvas)
	prompt=Label.new()
	prompt.position=Vector2(40,940)
	prompt.add_theme_font_size_override("font_size",25)
	canvas.add_child(prompt)
	debug=Label.new()
	debug.position=Vector2(35,35)
	debug.add_theme_font_size_override("font_size",22)
	debug.hide()
	canvas.add_child(debug)
	map_label=Label.new()
	map_label.position=Vector2(400,200)
	map_label.add_theme_font_size_override("font_size",26)
	map_label.hide()
	canvas.add_child(map_label)
	if not restore_data.is_empty():
		restore(restore_data)
	else:
		okto.set_physics_process(false)

func add_hazard(id: String, at: Vector2, width: float, warning: float, drop: float) -> void:
	var h=HAZARD.new()
	h.position=at
	h.span=width
	h.warning_duration=warning
	h.settle_drop=drop
	h.surface_id=id
	h.actor=okto
	add_child(h)
	hazards[id]=h
	h.state_changed.connect(func(key: String,state: int):
		if state==HAZARD.State.SETTLED:
			flags[key]=true
			save())

func _physics_process(delta: float) -> void:
	elapsed+=delta
	prompt.text=""
	if intro>0:
		intro-=delta
		prompt.text="Nomad Valley · an unfinished map, and a world beyond the familiar edge."
		if intro<=0:
			okto.set_physics_process(true)
		return
	if okto.position.x<600:
		prompt.text="A/D move · Shift run · Space jump · W climb / S release · Tab journal"
	if phase==0 and okto.position.x>2250:
		phase=1
		record("The village gives way to the mountain path.")
		set_checkpoint(Vector2(2250,938),1)
	if phase==1 and okto.position.x>4400 and okto.position.y<400:
		phase=2
		survey=4
		record("The high crest. A sheltered ledge folds back below the ascent.")
		set_checkpoint(Vector2(4420,378),2)
	if phase==2 and okto.position.x<2550 and okto.position.y>1050:
		phase=3
		record("A low cave beneath the mountain path.")
		set_checkpoint(Vector2(2500,1118),3)
	if phase==1 and absf(okto.position.x-3430)<140:
		survey=maxi(1,survey)
		prompt.text="Q · Survey the three rock formations"
		if Input.is_action_just_pressed("atlas_survey"):
			survey=maxi(2,survey)
			record("Two profiles align; the third marks a real opening along the ridge.")
			frame_camera(2.0)
	if phase==1 and okto.position.x>3990:
		survey=maxi(3,survey)
	if phase==3:
		if okto.position.x>3300 and okto.position.x<3900:
			prompt.text="Hold Ctrl · crouch under the stone"
		elif okto.position.x>=3900 and okto.position.x<4550:
			prompt.text="Hold C · crawl through the constriction"
		if okto.position.x>5400 and not flags.get("horizon",false):
			flags.horizon=true
			okto.get_node("Camera2D").limit_right=6200
			frame_camera(2.4)
			record("First Horizon · Broken Crossing beyond the cave.")
			set_checkpoint(Vector2(5500,1118),3)
		if okto.position.x>6000:
			completed=true
			prompt.text="Broken Crossing · R02 threshold reached"
	if Input.is_action_just_pressed("okto_reset") or okto.position.y>1450:
		restore(snapshot())
	if Input.is_action_just_pressed("atlas_map"):
		map_open=not map_open
		map_label.visible=map_open
		map_label.text="LIVING MAP · observed journey\n\n"+"\n".join(journal)+"\n\nTab · close"
		okto.set_physics_process(not map_open)
	if Input.is_action_just_pressed("nomad_debug"):
		debug.visible=not debug.visible
		show_topology=debug.visible
		get_tree().debug_collisions_hint=debug.visible
		queue_redraw()
	debug.text="1 CU = 54 px · phase %d · checkpoint %s\nstance %d / %.0f px · survey %d\nposition %s · velocity %s\nhazards %s" % [phase,checkpoint,okto.posture,okto.stance_height,survey,okto.position,okto.velocity,flags]
	if Input.is_action_just_pressed("atlas_pause"):
		get_tree().change_scene_to_file("res://Scene/nomad/main.tscn")

func record(entry: String) -> void:
	if not journal.has(entry):
		journal.append(entry)

func frame_camera(zoom: float) -> void:
	if reveal_tween!=null and reveal_tween.is_running():
		reveal_tween.kill()
	var camera: Camera2D=okto.get_node("Camera2D")
	reveal_tween=create_tween()
	reveal_tween.tween_property(camera,"zoom",Vector2.ONE*zoom,.8)
	reveal_tween.tween_interval(2)
	reveal_tween.tween_property(camera,"zoom",Vector2.ONE*4,.8)

func set_checkpoint(at: Vector2, route_phase: int) -> void:
	checkpoint=at
	checkpoint_phase=route_phase
	save()

func snapshot() -> Dictionary:
	return {"schema":2,"x":checkpoint.x,"y":checkpoint.y,"phase":checkpoint_phase,"survey":survey,"flags":flags.duplicate(true),"journal":journal.duplicate()}

func save() -> void:
	var error:=SAVE.write(snapshot(),save_path)
	if error!=OK:
		push_error("Nomad save failed: %s" % error)

func restore(data: Dictionary) -> void:
	intro=0
	phase=int(data.get("phase",0))
	checkpoint_phase=phase
	checkpoint=Vector2(float(data.get("x",110)),float(data.get("y",1198)))
	survey=int(data.get("survey",0))
	flags=data.get("flags",{}).duplicate(true)
	okto.get_node("Camera2D").limit_right=6200 if flags.get("horizon",false) else 5400
	journal.assign(data.get("journal",[]))
	okto.spawn_position=checkpoint
	okto.reset_to_spawn()
	okto.set_physics_process(true)
	map_open=false
	map_label.hide()
	for id in hazards:
		if flags.get(id,false):
			hazards[id].restore_settled()
		else:
			hazards[id].reset_surface()

func _draw() -> void:
	if not show_topology: return
	var paths: Array=[PackedVector2Array([Vector2(200,1140),Vector2(2000,900),Vector2(4600,250)]),PackedVector2Array([Vector2(4750,400),Vector2(4200,550),Vector2(2800,940)]),PackedVector2Array([Vector2(2550,1085),Vector2(5900,1085)])]
	var colors: Array[Color]=[Color("7bd8c1"),Color("e5b37c"),Color("8fc7f0")]
	for i in paths.size():
		var path: PackedVector2Array=paths[i]
		draw_polyline(path,colors[i],6)
		var end:=path[-1]
		var direction: Vector2=(end-path[-2]).normalized()
		draw_colored_polygon(PackedVector2Array([end,end-direction.rotated(.5)*65,end-direction.rotated(-.5)*65]),colors[i])
	var positions: Array[Vector2]=[Vector2(500,1030),Vector2(3300,700),Vector2(4200,1230)]
	var labels: Array[String]=["A01/A02 · RIGHT + UP", "A03 · LEFT + DOWN", "CAVE · RIGHT → R02"]
	for i in labels.size(): draw_string(ThemeDB.fallback_font,positions[i],labels[i],HORIZONTAL_ALIGNMENT_LEFT,-1,48,colors[i])
