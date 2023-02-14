extends Button

var graph_scene = preload("res://graph/graph_main.tscn")

func _pressed():
	get_tree().change_scene_to_packed(graph_scene)
