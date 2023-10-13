extends Node

var data={}
var empty_data={"Hidebox": 0, "Crab's Trouble": 0, "Beekeeper": 0}
const SAVE_FILE = "user://save.dat"

func _ready() -> void:
	load_data()
	for i in get_tree().get_nodes_in_group("ui"):
		i.connect("update_save", update_save)

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

func update_save(level_name: String, count_star: int) -> void:
	data[level_name] = count_star
	save_data()

func get_inf(level_name: String) -> int:
	return data[level_name]

func delete_save() -> void:
	data = empty_data
	save_data()
