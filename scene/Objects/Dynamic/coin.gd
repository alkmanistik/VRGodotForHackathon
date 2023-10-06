extends Area3D

const SPEED_ROTATE: float = 1

signal add_coin()

func _process(delta: float) -> void:
	rotation.y += SPEED_ROTATE * delta



func _on_body_entered(body: Node3D) -> void:
	add_coin.emit()
	queue_free()
