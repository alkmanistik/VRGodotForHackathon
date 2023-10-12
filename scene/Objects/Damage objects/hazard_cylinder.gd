extends Trap

func _ready():
	damage = 2

func _on_area_3d_body_entered(_body):
	hit(damage)
