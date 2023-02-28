extends Node


func _unhandled_key_input(event: InputEvent) -> void:
	if (event is InputEventKey and event.is_pressed() and event.keycode == KEY_ESCAPE):
		get_tree().change_scene_to_file("res://menu.tscn")
