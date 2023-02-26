extends Node2D
class_name DraftCard

signal drafted(card :DraftCard)

var outline_shader_material = preload("res://shader/outline_material.tres")

var held = false
var origin: Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (held):
		global_position = get_global_mouse_position()

func _input(event):
	if (event is InputEventMouseButton and event.is_pressed() and mouse_in_bounds()):
		drafted.emit(self)
		#dissolve()

func mouse_in_bounds() -> bool:
	var sprite_rect = $Sprite.get_rect()
	var pos = to_global(sprite_rect.position)
	
	var ref_rect = Rect2(pos, sprite_rect.size)
	
	return ref_rect.has_point(get_global_mouse_position())

func dissolve():
	
	
func _on_area_2d_mouse_entered():
	#$Sprite.material = outline_shader_material
	pass

func _on_area_2d_mouse_exited():
	#$Sprite.material = null
	pass

