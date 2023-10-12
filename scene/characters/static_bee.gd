extends CharacterBody3D

@onready var anim: AnimationPlayer = $Bee/AnimationPlayer

func _on_animation_player_animation_finished(_anim_name):
	anim.play("Flying")
