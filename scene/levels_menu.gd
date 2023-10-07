extends Panel

func _ready():
	pass # Replace with function body.
func _process(delta):
	pass
	
func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scene/Menu/main_menu.tscn")

func _on_hide_box_buton_pressed():
	get_tree().change_scene_to_file("res://scene/Levels(fix)/hidebox.tscn")

func _on_crabs_trouble_button_pressed():
	get_tree().change_scene_to_file("res://scene/Levels(fix)/crab's_trouble.tscn")

func _on_bee_saber_button_pressed():
	get_tree().change_scene_to_file("res://scene/Levels(fix)/bee_saber.tscn")



