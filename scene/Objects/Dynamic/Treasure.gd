extends Node3D

var is_open: bool = false

var can_open: bool = false

signal chest_open()

func _ready():
	for i in get_tree().get_nodes_in_group("ui"):
		i.connect("_have_key", have_key)
	$Chest/Chest_Armature/Skeleton3D/AnimationPlayer.play("Chest_Close", -1, 1000)

func open():
	$AnimationPlayer.play("open")


func _on_area_3d_body_entered(_body):
	if !is_open and can_open:
		open()
		$"../ChestOpen".play()
		is_open = true


func animation_finished(anim_name):
	if anim_name == "open":
		chest_open.emit()

func have_key():
	can_open = true
