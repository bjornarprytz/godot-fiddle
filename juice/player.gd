extends Node2D

const rotSpeed = 1.2
const startSpeed = 100.0
const maxSpeed = 350.0
const acceleration = 50.0
const deceleration = 20.0
const maxAmmo = 100.0
const cooldown = 0.1

var bullet_spawner = preload("res://juice/bullet.tscn")

var moveSpeed = startSpeed
var ammo = maxAmmo

var temperature = 0.0

func _physics_process(delta):
	var rot = 0
	var trans = Vector2(0,0)
	
	if Input.is_key_pressed(KEY_W):
		trans = -transform.y * moveSpeed * delta
	if Input.is_key_pressed(KEY_S):
		trans = transform.y * moveSpeed * delta
	if Input.is_key_pressed(KEY_A):
		rot = delta * rotSpeed * -PI
	if Input.is_key_pressed(KEY_D):
		rot = delta * rotSpeed * PI
	if (Input.is_key_pressed(KEY_SPACE)):
		shoot()
		
	translate(trans)
	rotate(rot)
	
	if (trans != Vector2(0,0)):
		moveSpeed = min(moveSpeed + (acceleration * delta), maxSpeed)
	else:
		moveSpeed = max(moveSpeed - (deceleration * delta), startSpeed)
	temperature -= delta
	
	var newColor = Color.DARK_RED * (moveSpeed / 400.0)
	
	newColor.a = 1.0
	
	$Body.color = newColor
	$Face.color = newColor

func shoot():
	if (temperature > 0.0):
		return
	temperature = cooldown
	
	var bullet = bullet_spawner.instantiate() as Bullet
	
	add_sibling(bullet)
	
	bullet.rotate(rotation)
	bullet.position = position
