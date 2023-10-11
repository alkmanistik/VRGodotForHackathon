extends RigidBody3D

@onready var true_cube: Node3D = $Cube_Question
@onready var mask_cube: Node3D = $Cube_Default

signal box_entered(is_right : bool)

func replace() -> void:
	true_cube.visible = !true_cube.visible
	mask_cube.visible = !mask_cube.visible

func _on_area_3d_body_entered(body):
	box_entered.emit(false)

func pointer_event(event : XRToolsPointerEvent) -> void:
	if event.event_type == XRToolsPointerEvent.Type.PRESSED:
		box_entered.emit(false)
