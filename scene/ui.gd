extends CanvasLayer

signal dead()

const MAX_HEALTH: int = 6
var health: int = 6
var max_coin: int = 0
var coin: int = 0
var star:int = 0

@onready var coin_label: Label = $MarginContainer/Coin/HBoxContainer/Coin_label
@onready var health_contаiner: HBoxContainer = $MarginContainer/Health/Health_Container
@onready var star_container: HBoxContainer = $MarginContainer/Star/Star_Container

@onready var full_star = preload("res://assets/custom assets/full_star.png")
@onready var rainbow_star = preload("res://assets/custom assets/rainbow_star.png")

func _ready() -> void:
	for i in get_tree().get_nodes_in_group("coin"):
		i.connect("add_coin", add_coin)
		max_coin += 1
	health_update()
	coin_update()

func add_coin() -> void:
	coin += 1
	coin_update()
	if coin == max_coin:
		add_star("money")

func coin_update() -> void:
	coin_label.text = str(coin)+"/"+str(max_coin)

func health_update() -> void:
	for i in health_contаiner.get_children():
		var temp_health = health
		if !temp_health:
			i.hide()
		else:
			i.show()
			temp_health -= 1

func take_damage() -> void:
	health -= 1
	if !health:
		dead.emit()
		return
	health_update()

func add_star(quest: String) -> void:
	var temp_star = star_container.get_child(star) as TextureRect
	temp_star.texture = full_star
	if quest == "main":
		temp_star.texture = rainbow_star
	star += 1
