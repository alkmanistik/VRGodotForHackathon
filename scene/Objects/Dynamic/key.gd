extends Node3D

signal add_key()

func _process(_delta):
	look_at(get_tree().get_first_node_in_group("player").global_position)
	rotation.x = 0

func _on_area_3d_body_entered(_body):
	SoundPlayer.play_key_sound()
	add_key.emit()
	queue_free()
