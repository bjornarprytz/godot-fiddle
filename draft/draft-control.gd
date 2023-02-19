extends Node2D


var api_factory = preload("res://draft/DraftApi.cs")


var api

func _ready():
	api = api_factory.new()
	$Picks.load_picks()


func _on_picks_card_picked(card: DraftCard):
	$Deck.add_card(card)
	$Picks.clear_picks()
	$Picks.load_picks()
	
