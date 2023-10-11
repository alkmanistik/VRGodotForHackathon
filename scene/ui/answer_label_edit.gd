extends Control

signal change_label(new_string: String)

@onready var text: TextEdit = $TextEdit

func _on_text_edit_text_changed():
	change_label.emit(text.text)
