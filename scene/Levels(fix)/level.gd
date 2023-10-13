extends Node3D
class_name Level

@onready var player = $Player
@onready var spawn_position: Marker3D = $SpawnPosition

func _ready():
	
	for i in get_tree().get_nodes_in_group("player"):
		player = i
	player.position = spawn_position.position

func _on_respawn_zone_body_entered(_body):
	player.position = spawn_position.position


func _on_area_3d_body_entered(body):
	player.position = spawn_position.position
