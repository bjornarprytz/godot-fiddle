extends State

var tween : Tween

func enter():
	if (tween):
		tween.kill()
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property(card, 'position', card.anchor, 0.8)

func _input(event):
	if (event is InputEventMouseButton and event.is_pressed() and card.mouse_in_bounds()):
		tween.kill()
		fsm.transition_to("Held")
