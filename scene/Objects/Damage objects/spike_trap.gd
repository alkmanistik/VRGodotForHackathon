extends Trap

func _ready():
	damage = 1

func _on_area_3d_body_entered(body):
	hit(damage)

