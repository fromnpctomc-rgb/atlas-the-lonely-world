extends Node2D
const OKTO = preload("res://Scene/characters/okto.tscn")
const MOSS = preload("res://Script/campaign/moss.gd")
const REACTIVE = preload("res://Script/campaign/reactive_platform.gd")
var director: Node
var index := 0
var definition: Dictionary
var okto: CharacterBody2D
var moss: CharacterBody2D
var nav_points: Array = []
var surfaces: Array[Rect2] = []
var mechanisms: Array = []
var gate: StaticBody2D
var stage := 0
var progress := 0.0
var coop_timer := 0.0
var entered_time := 0.0
var survey_seen := false
var checkpoint_x := 110.0
var width := 2900.0
var ground := Color("626e66")
var trim := Color("c3ccb0")
var title: Label
var prompt: Label
var announced := false
var end_announced := false

func _ready() -> void:
	definition = director.definitions[index]
	ground = Color(definition.color)
	RenderingServer.set_default_clear_color(Color(definition.sky))
	stage = int(director.stages.get(str(index),0))
	build_geometry()
	okto = OKTO.instantiate()
	okto.position = Vector2(110, floor_y(110)-2)
	okto.spawn_position = okto.position
	okto.set_meta("campaign",true)
	add_child(okto)
	var camera: Camera2D = okto.get_node("Camera2D")
	camera.limit_right = int(width)
	camera.limit_top = -300
	camera.limit_bottom = 1000
	camera.zoom = Vector2.ONE * 4
	for body in get_children():
		if body.get_script() == REACTIVE:
			body.player = okto
	if index >= 5:
		spawn_moss(Vector2(65,floor_y(65)-2))
	build_ui()
	apply_stage()
	director.record("A%02d" % (index+1))
	if director.restore_checkpoint:
		checkpoint_x = director.saved_x
		okto.spawn_position = Vector2(checkpoint_x, floor_y(checkpoint_x)-2)
		okto.reset_to_spawn()
		if index == 4 and checkpoint_x > 800 and moss == null:
			spawn_moss(Vector2(checkpoint_x-50, floor_y(checkpoint_x-50)-2))
		elif moss != null:
			moss.position = Vector2(checkpoint_x-50,floor_y(checkpoint_x-50)-2)
		director.restore_checkpoint = false
	queue_redraw()

func spawn_moss(at: Vector2) -> void:
	moss = MOSS.new()
	moss.name = "Moss"
	moss.position = at
	moss.player = okto
	add_child(moss)
	moss.set_navigation(nav_points)

func floor_y(x: float) -> float:
	var best := 900.0
	for r in surfaces:
		if x >= r.position.x and x <= r.end.x:
			best = minf(best,r.position.y)
	return best

func block(rect: Rect2, reactive := false, navigation := true) -> StaticBody2D:
	var body: StaticBody2D = REACTIVE.new() if reactive else StaticBody2D.new()
	body.position = rect.position
	body.collision_layer = 2
	body.collision_mask = 0
	if reactive:
		body.size = rect.size
	body.add_to_group("grabbable")
	var collision := CollisionShape2D.new()
	collision.name = "CollisionShape2D"
	var box := RectangleShape2D.new()
	box.size = rect.size
	collision.shape = box
	collision.position = rect.size/2
	# Thin bridge/shelf modules are pass-through from below; foundations and gates stay solid.
	collision.one_way_collision = navigation and rect.size.y <= 32
	collision.one_way_collision_margin = 3
	body.add_child(collision)
	var polygon := Polygon2D.new()
	polygon.polygon = PackedVector2Array([Vector2.ZERO,Vector2(rect.size.x,0),rect.size,Vector2(0,rect.size.y)])
	polygon.color = ground.darkened(.12) if not reactive else Color("9a8369")
	body.add_child(polygon)
	var edge := Line2D.new()
	edge.points = PackedVector2Array([Vector2.ZERO,Vector2(rect.size.x,0)])
	edge.width = 2
	edge.default_color = trim
	body.add_child(edge)
	add_child(body)
	if navigation:
		surfaces.append(rect)
		for x in range(int(rect.position.x+25),int(rect.end.x-10),75):
			nav_points.append(Vector2(x,rect.position.y))
		nav_points.append(Vector2(rect.end.x-22,rect.position.y))
	return body

func build_geometry() -> void:
	# A continuous catch tier makes every branch returnable, including failed fragile shelves.
	block(Rect2(0,740,width,180))
	var profile: Array = definition.profile
	for i in 5:
		var x := float(i*260)
		var y := float(profile[i])
		block(Rect2(x,y,205 if index>0 else 260,28))
		# Intermediate catch / return steps stay below the primary silhouette.
		block(Rect2(x+175,y+65,80,20))
	if index == 8:
		block(Rect2(1300,560,890,32))
		block(Rect2(2190,560,120,18),true)
		block(Rect2(2310,560,590,32))
		block(Rect2(2180,650,200,20))
	else:
		block(Rect2(1300,560,1600,32))
	# Visible return stairs from the catch tier; also a physical companion bypass.
	block(Rect2(820,690,105,18))
	block(Rect2(925,630,100,18))
	block(Rect2(1010,575,100,18))
	# Ramps are discrete jumpable shelves; no single rise exceeds the calibrated apex.
	for x in [1250,2450,2650]:
		block(Rect2(x,650,100,20))
		block(Rect2(x-65,695,100,20))
	# Two branch-and-rejoin pockets; both end before/after the mandatory mechanism.
	for start in [390,2100]:
		block(Rect2(start,470,110,18))
		block(Rect2(start+115,425,160,20))
		block(Rect2(start+285,470,110,18))
	if index in [1,2,3,4,6]:
		block(Rect2(850,505,110,18),true)
	if index == 0:
		# Doorway, cloth, tended plots and distant residents establish an inhabited home.
		for x in [30,370,780]:
			decoration(Rect2(x,floor_y(x)-120,100,110),Color("8c8169"))
			decoration(Rect2(x+35,floor_y(x)-55,25,55),Color("302e32"))
			decoration(Rect2(x-8,floor_y(x)-130,118,18),Color("b29168"))
		for x in [480,910,1150]:
			decoration(Rect2(x,floor_y(x)-30,12,30),Color("aaab8b"))
	if index == 2:
		block(Rect2(0,350,1450,110),false,false)
	if index in [4,5,8,9,12]:
		gate = block(Rect2(1900,0,30,740),false,false)
		mechanisms = [Vector2(1410,560),Vector2(1700,560)]
	if index == 1:
		for x in [1370,1550,1740]:
			decoration(Rect2(x,365-(x%3)*20,35,160),Color("8b9588"))
	block(Rect2(-45,-300,40,1300),false,false)
	block(Rect2(width,-300,40,1300),false,false)

func decoration(rect: Rect2, color: Color) -> void:
	var poly := Polygon2D.new()
	poly.position = rect.position
	poly.polygon = PackedVector2Array([Vector2.ZERO,Vector2(rect.size.x,0),rect.size,Vector2(0,rect.size.y)])
	poly.color = color
	poly.z_index = -1
	add_child(poly)

func build_ui() -> void:
	var canvas := CanvasLayer.new()
	add_child(canvas)
	title = Label.new()
	title.position = Vector2(55,40)
	title.add_theme_font_size_override("font_size",26)
	title.text = "A%02d · %s\n%s" % [index+1,definition.name,definition.region]
	canvas.add_child(title)
	prompt = Label.new()
	prompt.position = Vector2(55,970)
	prompt.add_theme_font_size_override("font_size",24)
	canvas.add_child(prompt)

func _physics_process(delta: float) -> void:
	entered_time += delta
	title.modulate.a = clampf(6-entered_time,0,1)
	prompt.text = ""
	if index == 0 and entered_time < 15:
		prompt.text = "A/D bergerak · Shift berlari · Space lompat · W naik / S turun saat bergantung · Tab peta · Esc jeda"
	if index == 4 and moss == null and okto.position.x > 780:
		spawn_moss(Vector2(1080,floor_y(1080)-2))
		director.record("Pertemuan pertama — Fallen Span")
		title.text = "Gerakan kecil di balik penyangga batu…"
		entered_time = 2
	if Input.is_action_just_pressed("okto_reset") or okto.position.y > 960 or (moss != null and moss.position.y > 960):
		director.retry()
		return
	if okto.is_on_floor() and okto.position.x > checkpoint_x + 650 and absf(okto.position.y-floor_y(okto.position.x))<5:
		if gate == null or stage >= 3 or okto.position.x < 1800:
			checkpoint_x = okto.position.x
			okto.spawn_position = okto.position
			director.save_checkpoint(index,checkpoint_x)
	if gate != null:
		update_puzzle(delta)
	if absf(okto.position.x-650)<90:
		prompt.text = "Q · Amati bentang / struktur"
		if Input.is_action_just_pressed("atlas_survey"):
			survey_seen = true
			director.record("Survey A%02d: %s" % [index+1,definition.discovery])
			var camera: Camera2D = okto.get_node("Camera2D")
			var tween := create_tween()
			tween.tween_property(camera,"zoom",Vector2.ONE*2.6,.7)
			tween.tween_interval(1.8)
			tween.tween_property(camera,"zoom",Vector2.ONE*4,.7)
	if index == 2 and okto.position.x > 1550 and not announced:
		announced = true
		director.record("First Horizon — Broken Crossing")
		var camera: Camera2D = okto.get_node("Camera2D")
		var tween := create_tween()
		tween.tween_property(camera,"zoom",Vector2.ONE*2.5,1.3)
		tween.tween_interval(3)
		tween.tween_property(camera,"zoom",Vector2.ONE*4,1.3)
	if index in [10,12] and okto.position.x > 2280 and moss != null and not end_announced and moss.position.distance_to(okto.position)<100:
		end_announced = true
		director.record("Moss terhenti sejenak — A%02d" % [index+1])
		moss.cooperating = true
		moss.goal = moss.position
		await get_tree().create_timer(1.5 if index == 10 else 2.5).timeout
		if is_instance_valid(moss):
			moss.cooperating = false
	if okto.position.x > width-140:
		if gate != null and stage < 3:
			prompt.text = "Lintasan masih tertahan mekanisme."
		elif index >= 4 and (moss == null or moss.position.x < width-260):
			prompt.text = "Okto menunggu Moss. Kembali mendekat bila ia berhenti."
		else:
			prompt.text = "E · Lanjut" if index < 13 else "E · Akhiri greybox di batas Fracture Approach"
			if Input.is_action_just_pressed("atlas_interact"):
				director.advance()
	queue_redraw()

func update_puzzle(delta: float) -> void:
	var near_first := okto.position.distance_to(mechanisms[0]) < 65
	var near_second := okto.position.distance_to(mechanisms[1]) < 65
	if stage == 0 and near_first:
		prompt.text = "Tahan E · " + str(definition.action)
		progress = minf(1,progress+delta/1.6) if Input.is_action_pressed("atlas_interact") else maxf(0,progress-delta)
		if progress >= 1:
			set_stage(1)
	elif stage == 1:
		if moss != null:
			moss.cooperating = true
			moss.goal = Vector2(1610,560)
			if moss.arrived:
				coop_timer += delta
				if coop_timer > 1:
					set_stage(2)
		if near_first or near_second:
			prompt.text = "Jalur kecil terbuka. Moss mengamati kait di seberang."
	elif stage == 2 and near_second:
		prompt.text = "Tahan E · " + ("Selaraskan rangka fisik" if index==12 else "Kunci penyangga / buka lintasan")
		progress = minf(1,progress+delta/(3.0 if index==12 else 1.6)) if Input.is_action_pressed("atlas_interact") else maxf(0,progress-delta)
		if progress >= 1:
			set_stage(3)
	elif not near_first and not near_second:
		progress = 0

func set_stage(value: int) -> void:
	stage = value
	progress = 0
	director.stages[str(index)] = stage
	apply_stage()
	director.save_checkpoint(index,checkpoint_x)

func apply_stage() -> void:
	if gate != null:
		gate.get_node("CollisionShape2D").set_deferred("disabled",stage>=3)
		gate.modulate.a = .12 if stage>=3 else 1
	if moss != null and stage>=2:
		moss.cooperating = false

func _draw() -> void:
	# Temporary vector environment layers, intentionally distinct from collision plane.
	var sky := Color(definition.sky)
	for x in range(-300,3200,260):
		var top := 150 + sin(x*.012+index)*95
		draw_colored_polygon(PackedVector2Array([Vector2(x,950),Vector2(x+20,top),Vector2(x+160,top-80),Vector2(x+270,950)]),sky.lightened(.07))
	if index in [7,8,9,10]:
		for x in range(0,2900,160):
			draw_line(Vector2(x,680),Vector2(x+110,710),Color("6bafaf"),5)
		for x in range(70,2900,190):
			draw_circle(Vector2(x,260),70,Color("334e40"))
	if index>=11:
		for x in range(100,2900,300):
			draw_line(Vector2(x,650),Vector2(x,40),Color("596168"),30)
			draw_arc(Vector2(x+140,80),140,PI,TAU,24,Color("596168"),18)
		for x in range(220,1200,160):
			draw_arc(Vector2(x,680),120,PI*1.15,PI*1.85,20,Color("8d8d7b"),13)
	if gate != null:
		draw_line(mechanisms[0]-Vector2(0,22),Vector2(1900,510),Color("afa58a"),2)
		for i in 2:
			var at: Vector2 = mechanisms[i]-Vector2(0,25)
			draw_circle(at,15,Color("3a4243"))
			draw_arc(at,15,0,TAU,24,Color("d6bd8c"),2)
			draw_line(at-Vector2(12,0),at+Vector2(12,0).rotated(progress*TAU),Color("d6bd8c"),2)
		if progress>0:
			draw_arc(mechanisms[0 if stage==0 else 1]-Vector2(0,25),21,-PI/2,-PI/2+progress*TAU,24,Color("f3d59a"),3)
		if index==8:
			var end_y := 705 if stage>0 else 590
			draw_line(Vector2(1370,580),Vector2(1550,end_y),Color("73bcc0"),7)
		if index==12:
			for i in 3:
				var x := 1480+i*95
				draw_line(Vector2(x,350),Vector2(x+(0 if stage>=3 else (i-1)*35),475),Color("a9ae9e"),9)
