extends Node3D

@export var open: bool
@onready var anim: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	if open:
		open_door()

func open_door():
	anim.play("open")
