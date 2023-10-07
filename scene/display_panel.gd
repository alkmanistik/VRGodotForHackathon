extends Node3D

var mesh_size
@onready var viewport: SubViewport = $SubViewport
@onready var panel_face: MeshInstance3D = $MeshInstance3D
@onready var touch_area: MeshInstance3D = $MeshInstance3D/Area

var is_mouse_held = false
var is_mouse_inside = false
var last_mouse_position3D = null
var last_mouse_position2D = null

func _ready():
	touch_area.connect("mouse_entered", self, "_mouse_entered_touch_area")

func  _mouse_entered_touch_area():
	is_mouse_inside = true

func _input(event):
	var is_mouse_event = false
	
	for mouse_event in [InputEventMouseButton, InputEventMouseMotion]:
		if event is mouse_event:
			is_mouse_event = true
	if is_mouse_event:
		handle_mouse(event)
	elif not is_mouse_event:
		viewport.event(event)

func handle_mouse(event):
	if event is InputEventMouseButton:
		is_mouse_held = event.pressed
	
	var mouse_pos3D = find_mouse(event.global_position)
	
	is_mouse_inside = mouse_pos3D != null
	
	if is_mouse_inside:
		mouse_pos3D = touch_area.global_transform.affine_inverse() * mouse_pos3D
		last_mouse_position3D = mouse_pos3D
	else:
		mouse_pos3D = last_mouse_position3D
		if mouse_pos3D == null:
			mouse_pos3D = Vector3.ZERO
	
	var mouse_pos2D = Vector2(mouse_pos3D.x, -mouse_pos3D.y)
	
	mouse_pos2D.x += mesh_size.x / 2
	mouse_pos2D.y += mesh_size.y / 2
	
	mouse_pos2D.x = mouse_pos2D.x / mesh_size.x
	mouse_pos2D.y = mouse_pos2D.y / mesh_size.y
	
	mouse_pos2D.x = mouse_pos2D.x * viewport.size.x
	mouse_pos2D.y = mouse_pos2D.y * viewport.size.y
	
	event.position = mouse_pos2D
	event.global_position = mouse_pos2D
func find_mouse(global_position):
	pass
	
