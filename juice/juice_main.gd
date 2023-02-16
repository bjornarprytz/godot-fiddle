extends Node2D

# The starting range of possible offsets using random values
var RANDOM_SHAKE_STRENGTH: float = 10.0

var rand = RandomNumberGenerator.new()
var shake_strength: float = 0.0

func _ready() -> void:
	rand.randomize()
	
	
func apply_random_shake() -> void:
	shake_strength = RANDOM_SHAKE_STRENGTH
	create_tween().tween_property(self, 'shake_strength', 0.0, 0.5)
	
func _process(delta: float) -> void:
	
	var shake_offset = _get_random_offset()
	
	# Shake by adjusting camera.offset so we can move the camera around the level via it's position
	$Camera2D.offset = shake_offset

func _get_random_offset() -> Vector2:
	return Vector2(
		rand.randf_range(-shake_strength, shake_strength),
		rand.randf_range(-shake_strength, shake_strength)
	)
