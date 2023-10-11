extends Node3D

@onready var destruction = $Destruction

func _on_area_3d_body_entered(body):
	destruction.destroy()
