extends State

func _process(delta):	
	target.position = lerp(target.position, target.anchor, delta * 10)

func _input(event):
	if (event is InputEventMouseButton and event.is_pressed() and target.mouse_in_bounds()):
		fsm.transition_to("Held")
