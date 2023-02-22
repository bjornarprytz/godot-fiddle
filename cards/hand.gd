extends Node2D

class_name Hand

const card_spacing = -40
const card_width = 192

func add_card(card: Card):
	
	var total_width = (card_spacing + card_width)
	
	card.anchor = Vector2((get_child_count()) * total_width, 0)
	add_child(card)
	card.position = Vector2(-total_width, 0)
	
	for i in get_children().size():

		var c = get_child(i) as Card

		var target_rot = PI / 16 + (i - floor((get_child_count() / 2))) * PI / 16
		var tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
		
		tween.tween_property(c, 'rotation', target_rot, 0.4)
