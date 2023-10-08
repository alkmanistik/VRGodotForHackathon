extends Node3D

@onready var true_cube: Node3D = $Cube_Exclamation
@onready var mask_cube: Node3D = $Cube_Question

signal box_entered(is_right: bool)

func replace() -> void:
	true_cube.visible = !true_cube.visible
	mask_cube.visible = !mask_cube.visible

func _on_area_3d_body_entered(body):
	box_entered.emit(true)
