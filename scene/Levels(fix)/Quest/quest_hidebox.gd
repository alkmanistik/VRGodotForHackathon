extends Quest

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var true_cube: Node3D = $Object/Cube/Cube_Exclamation
@onready var cube_node: Node3D = $Object/Cube

var object_ready: bool = false
var right_box: bool = false

func _ready():
	for i in get_tree().get_nodes_in_group("logic_cube"):
		i.connect("box_entered", check_right)
	randomize()

func quest_object_reset() -> void:
	object_ready = false
	anim.play("RESET")
	await anim.animation_finished
	anim.play("start")
	await anim.animation_finished
	true_cube.replace()
	anim.play(str(randi() % 3))
	await anim.animation_finished
	anim.play("end")
	await anim.animation_finished
	object_ready = true

func quest_object_after():
	for i in cube_node.get_children():
		i.replace()

func check_right(tag: bool):
	right_box = tag
	if !is_complete:
		check()

func check():
	if object_ready:
		if right_box:
			completed()
		else:
			teleport(start_position)
			quest_object_after()
			anim.play("start")
			await anim.animation_finished
			anim.play("to_default")
			await anim.animation_finished
			anim.play("end")
			await anim.animation_finished
			quest_object_after()
			true_cube.replace()
			start()
