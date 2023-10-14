extends RigidBody3D

@onready var destruction = $Destruction

func _on_area_3d_body_entered(body):
	var temp = get_parent().get_parent().get_parent().get_parent().vector_velocity.abs()
	if (max(temp.x, temp.y, temp.z) > 0.03) and (max(temp.x, temp.y, temp.z) < 0.5):
		SoundPlayer.play_break_sound()
		destruction.destroy()

func _process(delta):
	if position.y <= -10:
		destruction.destroy()
