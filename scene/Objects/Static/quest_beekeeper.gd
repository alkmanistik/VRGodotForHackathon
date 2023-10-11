extends Quest

@onready var bees: Node3D = $Object/Bee/Bees
@onready var bees_houses: Node3D = $"Object/Bee/bee's houses"
@onready var max_bees: int = bees.get_child_count()
@onready var max_bees_house: int = bees_houses.get_child_count()
@onready var answer_keybord: Node3D = $"Object/Crab's platform/Answer_Keybord"

var quantity_bees: int
var quantity_bees_house: int
var amount: int
var answer_array: Array
var currect_answer: int
var text_label: String = ""

const BEE_ON_HOUSE = 3
const COUNT_ANSWER = 3

func _ready():
	get_tree().get_first_node_in_group("answer_label").connect("change_label", change_label)
	randomize()
	quantity_bees = randi() % max_bees + 1
	quantity_bees_house = randi() % max_bees_house + 1
	amount = quantity_bees_house * BEE_ON_HOUSE + quantity_bees
	for i in bees.get_children():
		if quantity_bees <= 0:
			i.hide()
		else:
			quantity_bees -= 1
	for i in bees_houses.get_children():
		if quantity_bees_house <= 0:
			i.hide()
		else:
			quantity_bees_house -= 1
	answer_array = create_array()

func create_array() -> Array:
	var temp = [0,0,0]
	for i in temp:
		i = amount + randi() % 11 - 5
		while (i == amount):
			i = amount + randi() % 11 - 5
	currect_answer = randi() % COUNT_ANSWER
	temp[currect_answer] = amount
	return temp

func quest_object_reset() -> void:
	answer_keybord.hide()

func check() -> void:
	if  text_label.is_valid_int() and int(text_label) == amount:
		completed()

func change_label(name: String):
	text_label = name
