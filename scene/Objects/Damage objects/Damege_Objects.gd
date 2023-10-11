extends Node
class_name Trap

var damage : int = 1

signal emit_hit(damage:int)

func hit(_damage: int) -> void:
	emit_hit.emit(_damage)
