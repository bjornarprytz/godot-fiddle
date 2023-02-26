extends Node2D
class_name Picks

signal card_picked(card: Card)

var card_factory = preload("res://draft/card_draft.tscn")

func load_picks(array):
	
	_load_card(array[0], $Pick1)
	await get_tree().create_timer(0.5).timeout
	_load_card(array[1], $Pick2)
	await get_tree().create_timer(0.5).timeout
	_load_card(array[2], $Pick3)

func _load_card(card: Card, target: Node2D):
	var start_pos =  Vector2(-100.0, get_viewport_rect().size.y / 3)
	target.add_child(card)
	card.global_position = start_pos
	
	card.fsm.stateTransition.connect(_card_picked.bind(card), CONNECT_ONE_SHOT)
	
	var tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	
	await tween.tween_property(card, 'position', Vector2(0,0), 1.0).finished


func _card_picked(from:String, to: String, card: Card):
	if (to == 'Drafted'):
		card_picked.emit(card)
