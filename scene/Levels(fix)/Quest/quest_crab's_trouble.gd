extends Quest

@onready var cubes: Node3D = $Object/Cube
@onready var house: Node3D = $Object/scene
@onready var house_collision: CollisionShape3D = $Object/scene/StaticBody3D/CollisionShape3D

func quest_object_after():
	house.show()
	house_collision.disabled = false

func _process(delta):
	check()

func check():
	if !is_complete and cubes.get_child_count() == 0:
		completed()

func start_zone_func():
	pickaxe_switch()

func _on_start_body_exited(body):
	pickaxe_switch()

func pickaxe_switch():
	var temp = get_tree().get_first_node_in_group("pickaxe")
	temp.visible = !temp.visible
	temp.get_child(1).get_child(0).disabled = !temp.get_child(1).get_child(0).disabled
