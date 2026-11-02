extends Node2D
## Neutral mechanics laboratory; this room does not establish world geography.
const OKTO := preload("res://Scene/characters/okto.tscn")
var okto: CharacterBody2D

func _ready() -> void:
	for rect in [Rect2(-80, 0, 80, 1000), Rect2(2800, 0, 80, 1000),
		Rect2(0, 620, 900, 300), Rect2(1060, 620, 1740, 300),
		Rect2(260, 564, 90, 20),
		Rect2(360, 528, 160, 20), Rect2(620, 438, 160, 20),
		Rect2(1150, 540, 160, 20), Rect2(1450, 520, 200, 20),
		Rect2(1850, 520, 45, 100), Rect2(2160, 520, 220, 20)]:
		add_block(rect)
	okto = OKTO.instantiate()
	okto.position = Vector2(140, 580)
	okto.spawn_position = Vector2(140, 580)
	add_child(okto)
	var ui := CanvasLayer.new()
	add_child(ui)
	var panel := PanelContainer.new()
	panel.position = Vector2(24, 24)
	ui.add_child(panel)
	var label := Label.new()
	label.text = "ATLAS OF THE LONELY WORLD  /  PROTOTYPE\nA/D atau ←/→: jalan    Shift: lari    Space: lompat    R: reset"
	label.add_theme_font_size_override("font_size", 16)
	panel.add_child(label)
	add_marker(Vector2(40, 620), "MULAI")
	add_marker(Vector2(650, 400), "02 / PLATFORM")
	add_marker(Vector2(900, 700), "03 / JURANG — AUTO RESET")
	add_marker(Vector2(1800, 345), "04 / DINDING COLLISION")
	add_marker(Vector2(2500, 620), "05 / BATAS KAMERA")
	queue_redraw()

func add_block(rect: Rect2) -> void:
	var body := StaticBody2D.new()
	body.collision_layer = 2
	body.collision_mask = 1
	body.position = rect.position
	var shape := CollisionShape2D.new()
	var box := RectangleShape2D.new()
	box.size = rect.size
	shape.shape = box
	shape.position = rect.size * 0.5
	body.add_child(shape)
	var surface := Polygon2D.new()
	surface.polygon = PackedVector2Array([Vector2.ZERO, Vector2(rect.size.x, 0), rect.size, Vector2(0, rect.size.y)])
	surface.color = Color("56636c")
	body.add_child(surface)
	var edge := Line2D.new()
	edge.points = PackedVector2Array([Vector2.ZERO, Vector2(rect.size.x, 0)])
	edge.width = 3
	edge.default_color = Color("c1cabb")
	body.add_child(edge)
	add_child(body)

func add_marker(at: Vector2, caption: String) -> void:
	var label := Label.new()
	label.position = at - Vector2(0, 42)
	label.text = caption
	label.add_theme_font_size_override("font_size", 10)
	label.modulate = Color("bfcbcd")
	add_child(label)

func _draw() -> void:
	for x in range(0, 2801, 100):
		draw_line(Vector2(x, 0), Vector2(x, 900), Color(0.4, 0.5, 0.6, 0.09))
	for y in range(0, 901, 100):
		draw_line(Vector2(0, y), Vector2(2800, y), Color(0.4, 0.5, 0.6, 0.09))
