extends Node
const SAVE := "user://atlas_greybox_v1.json"
var definitions: Array = []
var stages := {}
var journal: Array = []
var current := 0
var saved_x := 110.0
var restore_checkpoint := false
var area: Node2D
var overlay: CanvasLayer
var menu_panel: PanelContainer
var map_label: Label

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	definitions = JSON.parse_string(FileAccess.get_file_as_string("res://Scene/campaign/areas.json"))
	load_save()
	build_menu()
	show_menu()

func load_save() -> void:
	if not FileAccess.file_exists(SAVE):
		return
	var data = JSON.parse_string(FileAccess.get_file_as_string(SAVE))
	if not data is Dictionary or int(data.get("schema",0)) != 1:
		return
	current = clampi(int(data.get("area",0)),0,13)
	saved_x = clampf(float(data.get("x",110)),50,2780)
	stages = data.get("stages",{})
	journal = data.get("journal",[])

func save_checkpoint(id: int, x: float) -> void:
	saved_x = x
	var data := {"schema":1,"area":id,"x":x,"stages":stages,"journal":journal}
	var file := FileAccess.open(SAVE+".tmp",FileAccess.WRITE)
	if file == null:
		push_error("Cannot save Atlas checkpoint")
		return
	file.store_string(JSON.stringify(data))
	file.close()
	var error := DirAccess.rename_absolute(SAVE+".tmp",SAVE)
	if error != OK:
		push_error("Checkpoint rename failed: %s" % error)

func record(entry: String) -> void:
	if not journal.has(entry):
		journal.append(entry)

func open_area(id: int, restore := false) -> void:
	get_tree().paused = false
	menu_panel.hide()
	map_label.hide()
	if area != null:
		remove_child(area)
		area.queue_free()
	current = id
	restore_checkpoint = restore
	area = load("res://Scene/campaign/A%02d.tscn" % (id+1)).instantiate()
	area.director = self
	area.index = id
	# Actors and world stop while menu is open, director remains responsive.
	area.process_mode = Node.PROCESS_MODE_PAUSABLE
	add_child(area)
	if not restore:
		save_checkpoint(current,110)

func retry() -> void:
	call_deferred("open_area",current,true)

func advance() -> void:
	if current < 13:
		call_deferred("open_area",current+1)
	else:
		record("A14 selesai — batas R05; R05 belum dibangun")
		show_menu()

func build_menu() -> void:
	overlay = CanvasLayer.new()
	overlay.layer = 20
	add_child(overlay)
	menu_panel = PanelContainer.new()
	menu_panel.position = Vector2(620,240)
	menu_panel.custom_minimum_size = Vector2(680,530)
	overlay.add_child(menu_panel)
	var box := VBoxContainer.new()
	box.add_theme_constant_override("separation",20)
	menu_panel.add_child(box)
	var heading := Label.new()
	heading.text = "ATLAS OF THE LONELY WORLD\nPrototype · Development build"
	heading.add_theme_font_size_override("font_size",28)
	box.add_child(heading)
	button(box,"Continue",func(): open_area(current,true))
	button(box,"Perjalanan baru",func():
		stages = {}
		journal = []
		open_area(0))
	button(box,"Movement calibration",func(): open_calibration())
	button(box,"R01 rebuild · connected route",func(): get_tree().change_scene_to_file("res://Scene/prototype/connected_r01.tscn"))
	var select := OptionButton.new()
	for i in definitions.size():
		select.add_item("DEV · A%02d / %s" % [i+1,definitions[i].name])
	box.add_child(select)
	button(box,"DEV · Buka area pilihan (mengganti checkpoint)",func(): open_area(select.selected))
	button(box,"Keluar",func(): get_tree().quit())
	map_label = Label.new()
	map_label.position = Vector2(200,120)
	map_label.add_theme_font_size_override("font_size",28)
	overlay.add_child(map_label)
	map_label.hide()

func button(box: VBoxContainer, text: String, action: Callable) -> void:
	var b := Button.new()
	b.text = text
	b.add_theme_font_size_override("font_size",23)
	b.pressed.connect(action)
	box.add_child(b)

func open_calibration() -> void:
	get_tree().paused=false
	menu_panel.hide()
	if area != null:
		remove_child(area)
		area.queue_free()
	area=load("res://Scene/prototype/calibration_room.tscn").instantiate()
	add_child(area)

func show_menu() -> void:
	get_tree().paused = true
	menu_panel.show()
	menu_panel.get_child(0).get_child(1).grab_focus()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("atlas_pause") and area != null:
		if menu_panel.visible or map_label.visible:
			menu_panel.hide()
			map_label.hide()
			get_tree().paused = false
		else:
			show_menu()
	if event.is_action_pressed("atlas_map") and area != null:
		map_label.visible = not map_label.visible
		menu_panel.hide()
		get_tree().paused = map_label.visible
		map_label.text = "LIVING MAP · jejak yang telah disaksikan\n\n" + "\n".join(journal) + "\n\nTab · kembali"
