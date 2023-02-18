extends Node2D

var enemy_spawner = preload("res://juice/enemy.tscn")

# The starting range of possible offsets using random values
var RANDOM_SHAKE_STRENGTH: float = 10.0

var rand = RandomNumberGenerator.new()
var shake_strength: float = 0.0
var timer : Timer

func _ready() -> void:
	rand.randomize()
	
	timer = Timer.new()
	add_child(timer)
	timer.connect('timeout', _spawn_enemy)
	timer.wait_time = 2.0
	timer.one_shot = false
	timer.start()
	
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

func _spawn_enemy():
	timer.wait_time = randf_range(1.0, 3.0)
	var enemy = enemy_spawner.instantiate() as Enemy
	
	$Enemies.add_child(enemy)
	
	var x = randf_range(0.0, get_viewport_rect().size.x)
	var y = -10.0
	
	enemy.position = Vector2(x, y)
	enemy.player = $Player

