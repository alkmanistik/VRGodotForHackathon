extends Node3D
class_name Quest

var is_start: bool = false
var is_complete: bool = false
var rotate_to_quest: Vector3 = Vector3.ZERO

@onready var start_position: Marker3D = $StartPosition

signal quest_complete()
signal startposition(marker: Marker3D)

func start() -> void:
	is_start = true
	quest_object_reset()

func completed() -> void:
	is_start= false
	is_complete = true
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
		teleport()
		start()

func teleport():
	var temp = get_tree().get_first_node_in_group("player")
	temp.position = start_position.get_global_position()
	temp.rotation = rotate_to_quest
