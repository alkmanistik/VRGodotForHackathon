extends Control

func _ready():
	$".".modulate = "777777"
func _on_mouse_entered():
	$".".modulate = "ffffff"

func _on_mouse_exited():
	$".".modulate = "777777"
