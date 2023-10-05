extends Node
class_name Trap

var damage : int = 1

signal emit_hit(damage:int)

func hit(damage: int) -> void:
	emit_hit.emit(damage)
