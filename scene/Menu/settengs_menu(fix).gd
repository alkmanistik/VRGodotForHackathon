extends CanvasLayer

@onready var viewport = get_tree().get_first_node_in_group("viewport_menu")
var main_menu = preload("res://scene/Menu/main_menu(fix).tscn")

func _on_back_button_pressed():
	viewport.scene = main_menu
