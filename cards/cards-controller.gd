extends Node2D

var card_spawner = preload("res://cards/card_front.tscn")
var card_api = preload("res://draft/DraftApi.cs")

func _on_deck_pressed():
	var api = card_api.new()
	
	var card = card_spawner.instantiate() as Card
	
	api.PlayCard(card, $Enemy)
	
	$Hand.add_card(card)
