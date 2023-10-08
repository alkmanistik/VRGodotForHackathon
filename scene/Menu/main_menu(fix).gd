extends Panel

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scene/Menu/levels_menu(fix).tscn")
	
func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://scene/Menu/settengs_menu(fix).tscn")

func _on_exit_button_pressed():
	get_tree().quit()
