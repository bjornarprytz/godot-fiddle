extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_key_pressed(KEY_W) and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_key_pressed(KEY_A):
		translate(Vector2(-1, 0) * delta * SPEED)
	if Input.is_key_pressed(KEY_D):
		translate(Vector2(1, 0) * delta * SPEED)

	move_and_slide()

func _unhandled_key_input(event: InputEvent) -> void:
	
	if (event.keycode == KEY_X):
		attack()

func attack():
	pass
	
