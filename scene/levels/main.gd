extends Node3D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("nkey"):
		get_node("cube/Destruction").destroy()

func _on_respawn_zone_body_exited(body: Node3D) -> void:
	body.position = $SpawnPosition.position
