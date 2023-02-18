extends Node2D
class_name Player

const rotSpeed = 1.2
const startSpeed = 100.0
const maxSpeed = 350.0
const acceleration = 50.0
const deceleration = 20.0
const maxAmmo = 100.0
const maxHealth = 100.0
const cooldown = 1.0

var bullet_spawner = preload("res://juice/bullet.tscn")
var playerObject : Node2D

var moveSpeed = startSpeed
var ammo = maxAmmo
var health = maxHealth

var temperature = 0.0

func _ready():
	playerObject = $Player

func _physics_process(delta):
	var rot = 0
	var trans = Vector2(0,0)
	
	if Input.is_key_pressed(KEY_W):
		trans = -$Player.transform.y * moveSpeed * delta
	if Input.is_key_pressed(KEY_S):
		trans = $Player.transform.y * moveSpeed * delta
	if Input.is_key_pressed(KEY_A):
		rot = delta * rotSpeed * -PI
	if Input.is_key_pressed(KEY_D):
		rot = delta * rotSpeed * PI
	if (Input.is_key_pressed(KEY_SPACE)):
		shoot()
		
	$Player.translate(trans)
	$Player.rotate(rot)
	
	if (trans != Vector2(0,0)):
		moveSpeed = min(moveSpeed + (acceleration * delta), maxSpeed)
	else:
		moveSpeed = max(moveSpeed - (deceleration * delta), startSpeed)
	temperature -= delta
	
func _process(delta):
	
	var newColor = Color.DARK_RED * (moveSpeed / 400.0)
	
	newColor.a = 1.0
	
	$Player/Body.color = newColor
	$Player/Face.color = newColor
	
	$UI.position = $Player.position
	$UI/HealthBar.max_value = maxHealth
	$UI/HealthBar.value = health

func shoot():
	if (temperature > 0.0):
		return
	temperature = cooldown
	
	var bullet = bullet_spawner.instantiate() as Bullet
	
	add_sibling(bullet)
	
	bullet.rotate($Player.rotation)
	bullet.position = $Player/Muzzle.global_position
	$Player/Muzzle/Flash.restart()


func _on_area_2d_area_entered(area):
	health -= 10.0
	get_parent().apply_random_shake()
