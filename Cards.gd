extends Button

var cards_scene = preload("res://cards/cards_main.tscn")

func _pressed():
	get_tree().change_scene_to_packed(cards_scene)
