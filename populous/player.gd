extends RigidBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const rotation_speed = 1.0

var _should_reset : bool = false
var _start_position : Vector3 = Vector3(0,0,0)
var local_gravity : Vector3 = Vector3(0,0,0)
var _move_direction : Vector3 = Vector3(0,0,0)
var _last_strong_direction : Vector3 = Vector3(0,0,0)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")



func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	if _should_reset:
		state.transform.origin = _start_position
		_should_reset = false
	
	local_gravity = state.total_gravity.normalized()
	
	if _move_direction.length() > 0.2:
		_last_strong_direction = _move_direction.normalized()
		
	_move_direction = _get_model_oriented_input()
	_orient_character_to_direction(_last_strong_direction, state.step)
	
	if (_is_on_floor(state)):
		apply_central_force(_move_direction * SPEED)
	
	linear_velocity = state.linear_velocity
	
func _get_model_oriented_input() -> Vector3:
	var input_left_right := (
		Input.get_action_strength("move_left")
		- Input.get_action_strength("move_right")
	)
	
	var input_forward := Input.get_action_strength("move_forward")
	
	var raw_input = Vector2(input_left_right, input_forward)
	
	var input := Vector3.ZERO
	
	# This ensures correct analogue input strength in any direction with joypad stick
	input.x = raw_input.x * sqrt(1.0 - raw_input.y * raw_input.y / 2.0)
	input.z = raw_input.y * sqrt(1.0 - raw_input.x * raw_input.x / 2.0)

	input = self.transform.basis * input # xform

	return input

func _orient_character_to_direction(direction: Vector3, delta: float):
	var left_axis := -local_gravity.cross(direction)
	var rotation_basis := Basis(left_axis, -local_gravity, direction).orthonormalized()
	
	# TODO: Fix this function
	
func _is_on_floor(state: PhysicsDirectBodyState3D) -> bool:
	for contact in state.get_contact_count():
		var contact_normal = state.get_contact_local_normal(contact)
		
		if (contact_normal.dot(-local_gravity) > 0.5):
			return true
			
	return false
