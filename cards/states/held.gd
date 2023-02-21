extends State


func _process(delta):
	card.global_position = card.get_global_mouse_position()

func _input(event):
	if (event is InputEventMouseButton and !event.is_pressed()):
		fsm.exit_state()
