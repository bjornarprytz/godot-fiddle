extends ColorRect

func _ready():
	var targetColor = Color.from_string("5384f1", Color.WHITE)
	
	# https://easings.net/
	var tween = create_tween()
	
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_QUAD)
	
	tween.tween_property(self, 'color', targetColor , 8.0)
	
	var button_tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_EXPO)
	
	button_tween.tween_property($Buttons, 'modulate:a', 255, 8.0)


func _on_cards_pressed() -> void:
	GameRoot.load_scene(self,"res://cards/cards_main.tscn" )
	#get_tree().change_scene_to_file("res://cards/cards_main.tscn")

func _on_graph_pressed() -> void:
	get_tree().change_scene_to_file("res://graph/graph_main.tscn")

func _on_juice_pressed() -> void:
	get_tree().change_scene_to_file("res://juice/juice_main.tscn")

func _on_crosslanguage_pressed() -> void:
	get_tree().change_scene_to_file("res://cross_language/cross_language_main.tscn")

func _on_draft_pressed() -> void:
	get_tree().change_scene_to_file("res://draft/draft_main.tscn")

func _on_night_sky_pressed() -> void:
	var tween = create_tween().set_ease(Tween.EASE_IN)
	await tween.tween_property($TransitionScreen, 'color:a', 1.0, 1.0).finished
	get_tree().change_scene_to_file("res://night_sky/night_sky_main.tscn")

func _on_shadows_pressed() -> void:
	get_tree().change_scene_to_file("res://shadows/shadows_main.tscn")

func _on_fight_pressed() -> void:
	get_tree().change_scene_to_file("res://fight/fight_main.tscn")


func _on_populous_pressed() -> void:
	GameRoot.load_scene(self,"res://populous/populous_main.tscn" )

func _on_watercolor_pressed() -> void:
	get_tree().change_scene_to_file("res://watercolor/watercolor_main.tscn")

func _on_map_deck_pressed() -> void:
	get_tree().change_scene_to_file("res://map_deck/map_deck_main.tscn")
