extends Level

@onready var start_teleport: Marker3D = $Mechanic/start_teleport
@onready var end_teleport: Marker3D = $Mechanic/end_teleport
var last = null
var vector_velocity

func _ready():
	for i in get_tree().get_nodes_in_group("player"):
		player = i

func _on_secret_teleport_body_entered(_body: Node3D) -> void:
	player.position = end_teleport.position - Vector3(-1*(player.position.z - start_teleport.position.z),-1,player.position.x - start_teleport.position.x)
	player.rotation_degrees.y += 90

func _process(delta):
	if last == null:
		last = $Player/RightXRController3D2/CollisionHandRight/pickaxe/Area3D.get_global_position()
	else:
		vector_velocity = ($Player/RightXRController3D2/CollisionHandRight/pickaxe/Area3D.get_global_position() - last)
		last = $Player/RightXRController3D2/CollisionHandRight/pickaxe/Area3D.get_global_position()
