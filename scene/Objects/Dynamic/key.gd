extends Node3D

signal add_key()

func _on_area_3d_body_entered(_body):
	add_key.emit()
	queue_free()
