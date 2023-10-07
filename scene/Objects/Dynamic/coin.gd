extends Area3D

@onready var pickup_audio: AudioStreamPlayer3D = $AudioStreamPlayer3D

const SPEED_ROTATE: float = 1

signal add_coin()

func _process(delta: float) -> void:
	rotation.y += SPEED_ROTATE * delta



func _on_body_entered(_body: Node3D) -> void:
	pickup_audio.play()
	add_coin.emit()
	queue_free()
