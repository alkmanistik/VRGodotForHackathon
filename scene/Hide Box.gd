extends Control

func _ready():
	$".".modulate = "666666"

func _on_hide_box_buton_mouse_entered():
	$".".modulate = "ffffff"

func _on_hide_box_buton_mouse_exited():
	$".".modulate = "666666"
