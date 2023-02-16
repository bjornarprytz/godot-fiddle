extends ColorRect

var tween

var card_scene = preload("res://cards/cards_main.tscn")
var graph_scene = preload("res://graph/graph_main.tscn")
var juice_scene = preload("res://juice/juice_main.tscn")

func _enter_tree():
	var targetColor = Color.from_string("5384f1", Color.WHITE)
	
	# https://easings.net/
	tween = create_tween()
	
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_QUAD)
	
	tween.tween_property(self, 'color', targetColor , 8.0)
	
	var button_tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_EXPO)
	
	button_tween.tween_property($Buttons, 'modulate:a', 255, 8.0)


func _on_cards_pressed():
	get_tree().change_scene_to_packed(card_scene)

func _on_graph_pressed():
	get_tree().change_scene_to_packed(graph_scene)

func _on_juice_pressed():
	get_tree().change_scene_to_packed(juice_scene)
