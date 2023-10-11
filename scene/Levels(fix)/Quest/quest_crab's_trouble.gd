extends Quest

@onready var cubes: Node3D = $Object/Cube
@onready var house: Node3D = $Object/scene
@onready var house_collision: CollisionShape3D = $Object/scene/StaticBody3D/CollisionShape3D

func quest_object_after():
	house.show()
	house_collision.disabled = false

func check():
	if !is_complete and cubes.get_child_count() == 0:
		completed()

