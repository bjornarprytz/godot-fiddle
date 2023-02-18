extends Node2D
class_name Bullet

const speed = 800.0
var damage : float

func _physics_process(delta):
	translate(-transform.y * speed * delta)
	
	if (!get_viewport_rect().has_point(global_position)):
		queue_free()

func _on_area_2d_area_entered(area):
	$Explotion.restart()
	$ColorRect2.visible = false
	await get_tree().create_timer(2.0).timeout
	queue_free()
	
