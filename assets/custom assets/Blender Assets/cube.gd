extends RigidBody3D

@onready var destruction = $Destruction
func _on_area_3d_body_entered(body):
	SoundPlayer.play_break_sound()
	destruction.destroy()
