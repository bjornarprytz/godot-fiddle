extends State

func _process(delta):
	target.global_position = target.get_global_mouse_position()

func _input(event):
	if (event is InputEventMouseButton and !event.is_pressed()):
		exited.emit(self)
