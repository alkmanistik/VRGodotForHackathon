extends CanvasLayer

@onready var viewport = get_tree().get_first_node_in_group("viewport_menu")
@onready var levels_menu = preload("res://scene/Menu/level_menu(fix).tscn")
@onready var settings_menu = preload("res://scene/Menu/settengs_menu(fix).tscn")


func _on_start_button_pressed():
	viewport.scene = levels_menu
	
func _on_settings_button_pressed():
	viewport.scene = settings_menu
	
func _on_exit_button_pressed():
	get_tree().quit()
