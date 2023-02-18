extends Node2D
class_name Enemy

var speed = randf_range(80.0, 160.0)

var player : Player

func _process(delta):
	var direction = (player.playerObject.global_position - global_position).normalized()
	
	translate(direction * delta * speed)

func _on_area_2d_area_entered(area):
	queue_free()
