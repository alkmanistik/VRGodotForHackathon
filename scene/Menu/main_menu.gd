extends Panel

func _on_start_button_pressed():
	

func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://scene/settengs_menu.tscn")

func _on_exit_button_pressed():
	get_tree().quit()




