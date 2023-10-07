extends Control

func _ready():
	$".".modulate = "666666"

func _on_crabs_trouble_button_mouse_entered():
	$".".modulate = "ffffff"

func _on_crabs_trouble_button_mouse_exited():
	$".".modulate = "666666"
