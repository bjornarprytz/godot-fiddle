extends VehicleBody3D

const speed = 20

const max_speed = 690

func _physics_process(delta: float) -> void:
	
	if Input.is_key_pressed(KEY_W):
		engine_force += delta * speed
	if Input.is_key_pressed(KEY_A):
		steering = -PI / 12
	if Input.is_key_pressed(KEY_D):
		steering = PI / 12
	if Input.is_key_pressed(KEY_S):
		brake += delta
	
	engine_force = min(engine_force, max_speed)
	print (engine_force)
		
