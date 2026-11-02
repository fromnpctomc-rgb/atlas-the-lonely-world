extends Node2D
## R01 rebuild milestone. Persistent actor/camera; authored editable area geometry.
const OKTO = preload("res://Scene/characters/okto.tscn")
var okto: CharacterBody2D
var area_id := -1
var title: Label
var prompt: Label
var elapsed := 0.0
var journal: Array[String] = []
var survey_tween: Tween
var map_open := false
var checkpoint := Vector2(110,638)
var revealed := false
var chunk_count := 3
var menu_path := "res://Scene/campaign/campaign.tscn"

func _ready() -> void:
	RenderingServer.set_default_clear_color(Color("303f43"))
	for id in chunk_count:
		var prefix := "R01" if id<3 else "R02"
		var chunk = load("res://Scene/rebuild/%s_A%02d.tscn" % [prefix,id+1]).instantiate()
		chunk.position.x=id*4000
		add_child(chunk)
	okto=OKTO.instantiate()
	okto.position=checkpoint
	okto.spawn_position=checkpoint
	okto.set_meta("campaign",true)
	add_child(okto)
	var camera: Camera2D=okto.get_node("Camera2D")
	camera.limit_left=0
	camera.limit_right=chunk_count*4000
	camera.limit_top=120
	camera.limit_bottom=900
	camera.zoom=Vector2.ONE*3.6
	var canvas:=CanvasLayer.new()
	add_child(canvas)
	title=Label.new()
	title.position=Vector2(40,32)
	title.add_theme_font_size_override("font_size",27)
	canvas.add_child(title)
	prompt=Label.new()
	prompt.position=Vector2(40,960)
	prompt.add_theme_font_size_override("font_size",23)
	canvas.add_child(prompt)

func _physics_process(delta: float) -> void:
	elapsed+=delta
	var next_id:=clampi(int(okto.position.x/4000),0,2)
	if next_id!=area_id:
		area_id=next_id
		elapsed=0
		title.text=["A01 · Nomad Settlement", "A02 · Survey Ridge", "A03 · Cliff Passage"][area_id]
		journal.append(title.text)
	title.modulate.a=clampf(5-elapsed,0,1)
	prompt.text=""
	if okto.position.x<500:
		prompt.text="A/D move · Shift run · Space jump · W climb / S release · Tab journal · R checkpoint"
	if okto.position.x>4000 and okto.position.x<4250 and okto.is_on_floor():
		checkpoint=Vector2(4080,638)
	if okto.position.x>8000 and okto.position.x<8250 and okto.is_on_floor():
		checkpoint=Vector2(8080,638)
	if absf(okto.position.x-6250)<110:
		prompt.text="Q · Observe the alignment of the three rock formations"
		if Input.is_action_just_pressed("atlas_survey"):
			journal.append("Survey: the split crown and leaning rock frame a narrow fracture.")
			frame_vista(2.5)
	if okto.position.x>11200 and not revealed:
		revealed=true
		frame_vista(2.4)
		journal.append("First Horizon: a fractured crossing beyond the valley.")
	if chunk_count==3 and okto.position.x>11700:
		prompt.text="R01 rebuild boundary · R02–R04 still use the earlier experimental build"
	if Input.is_action_just_pressed("okto_reset") or okto.position.y>1050:
		okto.spawn_position=checkpoint
		okto.reset_to_spawn()
	if Input.is_action_just_pressed("atlas_map"):
		map_open=not map_open
		okto.set_physics_process(not map_open)
	if map_open:
		prompt.text="JOURNEY JOURNAL\n"+"\n".join(journal)+"\nTab · close"
		prompt.position.y=150
	else:
		prompt.position.y=960
	if Input.is_action_just_pressed("atlas_pause"):
		get_tree().change_scene_to_file(menu_path)

func frame_vista(scale: float) -> void:
	if survey_tween!=null and survey_tween.is_running():
		survey_tween.kill()
	var camera: Camera2D=okto.get_node("Camera2D")
	survey_tween=create_tween()
	survey_tween.tween_property(camera,"zoom",Vector2.ONE*scale,.9)
	survey_tween.tween_interval(2.5)
	survey_tween.tween_property(camera,"zoom",Vector2.ONE*3.6,.9)
