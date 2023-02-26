extends Node2D


var api_factory = preload("res://draft/DraftApi.cs")
var api
var current_picks : Array

func _ready():
	api = api_factory.new()
	_load_next_picks()
	

func _load_next_picks():
	current_picks = api.GetPicks()
	$Picks.load_picks(current_picks)

func _on_picks_card_picked(card: Card):
	$Deck.add_card(card)
	for otherCard in current_picks:
		if (card != otherCard):
			otherCard.fsm.transition_to('Dissolving')

	# _load_next_picks()
	
