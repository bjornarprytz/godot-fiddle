extends Node2D
class_name Bullet

const speed = 800.0
var damage : float

var flash_spawner = preload("res://juice/explosion_flash.tscn")

func _physics_process(delta):
	translate(-transform.y * speed * delta)
	
	if (!get_viewport_rect().has_point(global_position)):
		queue_free()

func _on_area_2d_area_entered(area):
	$Explotion.restart()
	
	var flash = flash_spawner.instantiate() as Node2D
	
	add_sibling(flash)
	flash.global_position = global_position
	
