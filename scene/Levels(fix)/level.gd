extends Node3D

@onready var player = $Player
@onready var spawn_position: Marker3D = $SpawnPosition
@onready var ui: CanvasLayer = $UI

func _ready():
	player.position = spawn_position.position


func _on_respawn_zone_body_entered(body):
	player.position = spawn_position.position
