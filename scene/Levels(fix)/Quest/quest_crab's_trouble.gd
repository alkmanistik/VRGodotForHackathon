extends Quest

@onready var cubes: Node3D = $Object/Cube
@onready var house: Node3D = $Object/scene
@onready var house_collision: CollisionShape3D = $Object/scene/StaticBody3D/CollisionShape3D

func _ready() -> void:
	rotate_to_quest = Vector3(0,0,0)

func quest_object_after():
	house.show()
	house_collision.disabled = false

func check():
	if cubes.get_child_count() == 0:
		completed()

