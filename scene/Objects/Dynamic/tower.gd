extends Node3D

@onready var anim: AnimationPlayer = $AnimationPlayer

func _ready():
	for i in get_tree().get_nodes_in_group("quest"):
		i.connect("quest_complete", open_door)

func open_door() -> void:
	anim.play("open_door")

func _on_exit_zone_body_entered(_body):
	print("Выход")
