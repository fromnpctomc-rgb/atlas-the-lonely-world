extends Node
const SAVE = preload("res://Script/opening/journey_save.gd")
var panel: PanelContainer
var settings: Label
var world: Node2D
func _ready() -> void:
	RenderingServer.set_default_clear_color(Color("273c3c"))
	var layer:=CanvasLayer.new()
	add_child(layer)
	panel=PanelContainer.new()
	panel.position=Vector2(620,270)
	panel.custom_minimum_size=Vector2(680,500)
	layer.add_child(panel)
	var box:=VBoxContainer.new()
	box.add_theme_constant_override("separation",20)
	panel.add_child(box)
	var title:=Label.new()
	title.text="ATLAS OF THE LONELY WORLD\nThe Edge of the World\nOpening Greybox · A01–A07"
	title.add_theme_font_size_override("font_size",29)
	box.add_child(title)
	add_button(box,"New Game",func(): begin(false))
	var cont:=add_button(box,"Continue",func(): begin(true))
	cont.disabled=SAVE.read().is_empty()
	add_button(box,"Settings / Controls",func(): settings.visible=not settings.visible)
	settings=Label.new()
	settings.text="A/D move · Shift run · Space jump\nW climb · S drop · E interact · Q Survey\nTab journal · R checkpoint · Esc menu\nCamera shake: off · Text: large"
	settings.hide()
	box.add_child(settings)
	add_button(box,"Quit",func(): get_tree().quit())
	box.get_child(1).grab_focus()
func add_button(box: VBoxContainer, text: String, action: Callable) -> Button:
	var button:=Button.new()
	button.text=text
	button.add_theme_font_size_override("font_size",25)
	button.pressed.connect(action)
	box.add_child(button)
	return button
func begin(resume: bool) -> void:
	panel.hide()
	world=load("res://Scene/opening/world.tscn").instantiate()
	if resume:
		world.restore_data=SAVE.read()
	add_child(world)
