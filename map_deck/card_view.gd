extends Control

@onready var camera_control : CameraControl = $SubViewportContainer/SubViewport/SubScene

@export var move_scale: float = 5.0

func _physics_process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	
	var mid = get_viewport_rect().size / 2.0
	
	
	camera_control.set_camera_pos((mid - mouse_pos) / move_scale)
	
