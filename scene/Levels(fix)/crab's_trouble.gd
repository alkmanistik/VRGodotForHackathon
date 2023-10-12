extends Level

@onready var start_teleport: Marker3D = $Mechanic/start_teleport
@onready var end_teleport: Marker3D = $Mechanic/end_teleport

func _on_secret_teleport_body_entered(body: Node3D) -> void:
	body.position = end_teleport.position - Vector3(-1*(body.position.z - start_teleport.position.z),0,body.position.x - start_teleport.position.x)
	body.rotation_degrees.y += 90
