extends Node3D

var is_open: bool = false

var can_open: bool = false

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var anim_chest: AnimationPlayer = $Chest/Chest_Armature/Skeleton3D/AnimationPlayer

signal chest_open()

func _ready():
	for i in get_tree().get_nodes_in_group("ui"):
		i.connect("_have_key", have_key)
	anim_chest.play("Chest_Close", -1, 1000)

func open():
	anim.play("open")


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
