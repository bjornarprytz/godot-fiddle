extends ColorRect

var tween

func _ready():
	var targetColor = Color.from_string("5384f1", Color.WHITE)
	
	# https://easings.net/
	tween = create_tween()
	
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_QUAD)
	
	tween.tween_property(self, 'color', targetColor , 8.0)
	
	var button_tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_EXPO)
	
	button_tween.tween_property($Buttons, 'modulate:a', 255, 8.0)


func _on_cards_pressed():
	get_tree().change_scene_to_file("res://cards/cards_main.tscn")

func _on_graph_pressed():
	get_tree().change_scene_to_file("res://graph/graph_main.tscn")

func _on_juice_pressed():
	get_tree().change_scene_to_file("res://juice/juice_main.tscn")

func _on_crosslanguage_pressed():
	get_tree().change_scene_to_file("res://cross_language/cross_language_main.tscn")
