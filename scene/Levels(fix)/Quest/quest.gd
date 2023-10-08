extends Node3D
class_name Quest

var is_start: bool = false
var is_complete: bool = false

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
		start()
