extends Node2D
const OKTO := preload("res://Scene/characters/okto.tscn")
var okto: CharacterBody2D
var report: Label

func _ready() -> void:
	RenderingServer.set_default_clear_color(Color("27313a"))
	# Start/run/stop lane and recoverable jump-range markers.
	platform(Rect2(0,640,680,90),false)
	platform(Rect2(770,640,180,24),true)
	platform(Rect2(1020,640,180,24),true)
	platform(Rect2(1280,640,440,90),false)
	# Increasing lip heights: ballistic jump stays low; hands provide the extra reach.
	platform(Rect2(1840,608,180,28),true)
	platform(Rect2(2100,576,180,28),true)
	platform(Rect2(2360,544,180,28),true)
	platform(Rect2(2620,512,180,28),true)
	platform(Rect2(2900,640,700,90),false)
	# Tall clean face and three marked grab bands for controlled reach trials.
	platform(Rect2(3650,360,220,340),false)
	for y in [600,568,536,504]:
		var mark := Line2D.new()
		mark.points = PackedVector2Array([Vector2(3650,y),Vector2(3690,y)])
		mark.width = 3
		mark.default_color = Color("e2bd79")
		add_child(mark)
	platform(Rect2(3880,640,520,90),false)
	var wall := StaticBody2D.new()
	wall.position = Vector2(4350,0)
	wall.collision_layer = 2
	var shape := CollisionShape2D.new()
	var box := RectangleShape2D.new()
	box.size = Vector2(24,900)
	shape.shape = box
	shape.position.y=450
	wall.add_child(shape)
	add_child(wall)
	okto = OKTO.instantiate()
	okto.position = Vector2(110,638)
	okto.spawn_position = okto.position
	add_child(okto)
	var camera: Camera2D = okto.get_node("Camera2D")
	camera.zoom = Vector2.ONE*4
	camera.limit_right = 4400
	camera.limit_bottom = 850
	var ui := CanvasLayer.new()
	add_child(ui)
	var panel := PanelContainer.new()
	panel.position=Vector2(38,32)
	ui.add_child(panel)
	var column := VBoxContainer.new()
	panel.add_child(column)
	var title := Label.new()
	title.text="MOVEMENT CALIBRATION · 1 CU = 54 px"
	title.add_theme_font_size_override("font_size",22)
	column.add_child(title)
	var instructions := Label.new()
	instructions.text="A/D move · Shift run · Space jump · W climb / S release\nRunway + marked jump gaps → rising grab lips → solid wall → landings"
	column.add_child(instructions)
	report=Label.new()
	column.add_child(report)
	queue_redraw()

func platform(rect: Rect2, grab := false) -> void:
	var body := StaticBody2D.new()
	body.position=rect.position
	body.collision_layer=2
	if grab:
		body.add_to_group("grabbable")
	var shape:=CollisionShape2D.new()
	var box:=RectangleShape2D.new()
	box.size=rect.size
	shape.shape=box
	shape.position=rect.size/2
	body.add_child(shape)
	var surface:=Polygon2D.new()
	surface.polygon=PackedVector2Array([Vector2.ZERO,Vector2(rect.size.x,0),rect.size,Vector2(0,rect.size.y)])
	surface.color=Color("69736d")
	body.add_child(surface)
	var edge:=Line2D.new()
	edge.points=PackedVector2Array([Vector2.ZERO,Vector2(rect.size.x,0)])
	edge.width=3
	edge.default_color=Color("d0ccb4")
	body.add_child(edge)
	add_child(body)

func _process(_delta: float) -> void:
	if is_instance_valid(okto):
		report.text="Speed %.0f · apex %.0f px · grab %s" % [absf(okto.velocity.x),maxf(0,okto.spawn_position.y-okto.global_position.y),"HANG" if okto.hanging else ("CLIMB" if okto.climbing else "—")]

func _draw() -> void:
	for x in range(0,4401,54):
		draw_line(Vector2(x,0),Vector2(x,780),Color(.7,.8,.9,.06),1)
	for y in range(0,781,54):
		draw_line(Vector2(0,y),Vector2(4400,y),Color(.7,.8,.9,.06),1)
	for x in [680,950,1200,1720,2020,2280,2540,2820,3600,3880]:
		draw_line(Vector2(x,620),Vector2(x,650),Color("e2bd79"),3)
	var labels=["run / brake","walk jump","run reach","hand reach: +0.6 CU steps","ledge limits","solid wall","landing / recovery"]
	var positions=[Vector2(120,590),Vector2(710,595),Vector2(960,595),Vector2(1290,600),Vector2(1840,475),Vector2(3400,330),Vector2(3900,600)]
	for i in labels.size():
		draw_string(ThemeDB.fallback_font,positions[i],labels[i],HORIZONTAL_ALIGNMENT_LEFT,-1,18,Color("f0e5cc"))
