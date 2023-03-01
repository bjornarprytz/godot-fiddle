extends Node2D

const speed = 200.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var direction : Vector2
	
	if Input.is_key_pressed(KEY_W):
		direction += Vector2(0,-1)
	if Input.is_key_pressed(KEY_S):
		direction += Vector2(0,1)
	if Input.is_key_pressed(KEY_A):
		direction += Vector2(-1,0)
	if Input.is_key_pressed(KEY_D):
		direction += Vector2(1,0)
		
	translate(direction.normalized() * speed * delta)
	
	if Input.is_key_pressed(KEY_E):
		$LightSource.scale += (Vector2(1, 1) * delta)
	if Input.is_key_pressed(KEY_Q):
		$LightSource.scale -= (Vector2(1, 1) * delta)
