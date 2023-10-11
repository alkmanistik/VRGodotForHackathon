extends CanvasLayer

@onready var viewport = get_tree().get_first_node_in_group("viewport_menu")
var main_menu = preload("res://scene/Menu/main_menu(fix).tscn")
@onready var level_container: HBoxContainer = $"Control/VBoxContainer/ScrollContainer/Level Container"
var full_star = preload("res://assets/custom assets/full_star.png")
var rainbow_star = preload("res://assets/custom assets/rainbow_star.png")

var hidebox = preload("res://scene/Levels(fix)/hidebox.tscn")
var crabs_trouble = preload("res://scene/Levels(fix)/crab's_trouble.tscn")
var beekeeper = preload("res://scene/Levels(fix)/beekeeper.tscn")

func _ready():
	for i in level_container.get_children():
		var temp = Save.get_inf(i.name)
		if temp == 0:
			continue
		var container = i.get_child(2)
		for star in container.get_children():
			if temp == 0:
				break
			if star == container.get_child(0):
				star.texture = rainbow_star
			else:
				star.texture = full_star
			temp -= 1

func _on_button_pressed():
	viewport.scene = main_menu


func _on_hidebox_button_pressed():
	get_tree().change_scene_to_packed(hidebox)


func _on_crabs_trouble_button_pressed():
	get_tree().change_scene_to_packed(crabs_trouble)


func _on_beekeeper_button_pressed():
	get_tree().change_scene_to_packed(beekeeper)
