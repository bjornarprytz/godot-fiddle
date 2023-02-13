extends Node2D

var card_spawner = preload("res://cards/cards_front.tscn")

func _on_deck_pressed():
	var card = card_spawner.instantiate()
	
	$Hand.add_child(card)
