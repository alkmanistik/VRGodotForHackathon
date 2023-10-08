extends Node

var data={}
var empty_data={}
const SAVE_FILE = "user://save.dat"

func _ready() -> void:
	return
	load_data()

func save_data() -> void:
	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	file.store_var(data)
	file = null

func load_data() -> void:
	if !FileAccess.file_exists(SAVE_FILE):
		data = empty_data
	save_data()
	var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
	data = file.get_var()
	file = null

func update_save(name: String, count_star: int, is_finish: bool) -> void:
	data[name]=[count_star, is_finish]
	save_data()

func get_inf(name: String) -> Array:
	return data[name]
