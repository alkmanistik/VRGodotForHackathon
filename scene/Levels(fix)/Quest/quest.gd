extends Node3D
class_name Quest

var is_start: bool = false
var is_complete: bool = false
var rotate_to_quest: Vector3 = Vector3.ZERO

@onready var start_position: Marker3D = $StartPosition
@onready var end_position: Marker3D = $EndPosition

signal quest_complete()

func start() -> void:
	is_start = true
	quest_object_reset()

func completed() -> void:
	is_start= false
	is_complete = true
	teleport(end_position)
	quest_complete.emit()
	quest_object_after()

func quest_object_reset() -> void:
	return

func quest_object_after() -> void:
	return

func check_zone(_body) -> void:
	check()

func check() -> void:
	return


func start_zone(_body):
	if !is_complete and !is_start:
		teleport(start_position)
		start()

func teleport(where: Marker3D):
	var temp = get_tree().get_first_node_in_group("player")
	temp.position = where.get_global_position()
	temp.rotation = rotate_to_quest
