extends Node3D



func _on_respawn_zone_body_exited(body: Node3D) -> void:
	body.position = $SpawnPosition.position
