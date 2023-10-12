extends Node3D

@onready var anim: AnimationPlayer = $AnimationPlayer
var main_level = "res://scene/Levels(fix)/main_level.tscn"

signal save()

func _ready():
	for i in get_tree().get_nodes_in_group("quest"):
		i.connect("quest_complete", open_door)

func open_door() -> void:
	anim.play("open_door")

func _on_exit_zone_body_entered(_body):
	save.emit()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file(main_level)
