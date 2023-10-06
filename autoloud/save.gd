extends Node

var data={}
const SAVE_FILE = "user://save.dat"

func _ready() -> void:
	load_data()

func save_data():
	var file = FileAccess.open(save_file, FileAccess.WRITE)
	data =  {
		"count_star" = count_star,
		"is_finish" = is_finish
	}

	file.store_var(data)
	file = null
func load_data():
	if !FileAccess.file_exists(save_file):
		data = {
			"Hidebox" = [0,0],
			"Crab's Trouble" = [0, 0],
			"Bee Saber" = [0, 0],
			"Climbing" = [0, 0]
		}
		save_data()
	var file = FileAccess.open(save_file, FileAccess.READ)
	data = file.get_var()
	file = null
	is_finish = data.is_finish
	count_star = data.count_star
