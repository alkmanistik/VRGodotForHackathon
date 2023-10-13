extends RigidBody3D

@onready var destruction = $Destruction

func _on_area_3d_body_entered(body):
	if abs(get_parent().get_parent().get_parent().get_parent().vector_velocity) > Vector3(0.01,0.01,0.01):
		SoundPlayer.play_break_sound()
		destruction.destroy()

func _process(delta):
	if position.y <= -10:
		destruction.destroy()
