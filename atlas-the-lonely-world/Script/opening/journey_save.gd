extends RefCounted
const PATH := "user://atlas_opening_v2.json"
static func write(data: Dictionary, path: String=PATH) -> Error:
	var file:=FileAccess.open(path+".tmp",FileAccess.WRITE)
	if file==null:
		return FileAccess.get_open_error()
	file.store_string(JSON.stringify(data))
	file.close()
	return DirAccess.rename_absolute(path+".tmp",path)
static func read(path: String=PATH) -> Dictionary:
	if not FileAccess.file_exists(path):
		return {}
	var data=JSON.parse_string(FileAccess.get_file_as_string(path))
	if not data is Dictionary or int(data.get("schema",0))!=2:
		return {}
	return data
