extends "res://scene/Levels(fix)/level.gd"

@onready var anim_crab: AnimationPlayer = $Objects/Crab/AnimationPlayer

func _ready():
	player.position = spawn_position.position
	anim_crab.connect("animation_finished", idle_anim)

func idle_anim(anim_name: String):
	anim_crab.play("Jump")
