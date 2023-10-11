extends "res://scene/Levels(fix)/level.gd"

@onready var anim_crab: AnimationPlayer = $Objects/Crab/AnimationPlayer
@onready var anim_bee: AnimationPlayer = $Objects/Path3D/PathFollow3D/Bee/AnimationPlayer
@onready var anim_skull: AnimationPlayer = $Objects/Rock/Skull/AnimationPlayer
@onready var anim_char: AnimationPlayer = $Objects/Character/AnimationPlayer
@onready var path_bee: PathFollow3D = $Objects/Path3D/PathFollow3D
@onready var gem: Node3D = $Objects/Gem_Green

const PATH_SPEED = 0.1
const SPEED_ROTATE = 1
func _ready():
	player.position = spawn_position.position
	anim_crab.connect("animation_finished", idle_anim)
	anim_bee.connect("animation_finished", idle_anim)
	anim_skull.connect("animation_finished", idle_anim)
	anim_char.connect("animation_finished", idle_anim)

func idle_anim(anim_name: String):
	if anim_name == "Idle":
		anim_crab.play("Jump")
	if anim_name == "Jump":
		anim_crab.play("Idle")
	if anim_name == "Flying":
		anim_bee.play("Flying")
	if anim_name == "Bite_InPlace":
		await get_tree().create_timer(0.4).timeout
		anim_skull.play("Bite_InPlace")
	if anim_name == "Wave":
		await get_tree().create_timer(0.2).timeout
		anim_char.play("Wave")

func _process(delta):
	path_bee.progress_ratio += PATH_SPEED * delta
	gem.rotation.y += SPEED_ROTATE * delta
