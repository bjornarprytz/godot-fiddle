extends Node2D
class_name Bullet

const speed = 800.0
var damage : float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	translate(-transform.y * speed * delta)
	
	if (!get_viewport_rect().has_point(global_position)):
		queue_free()
		get_parent().apply_random_shake()


func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("Bullet hit something!", area)
	pass
