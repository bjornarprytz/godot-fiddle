extends Node2D
class_name DraftCard

signal drafted(card :DraftCard)

var held = false
var origin: Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (held):
		global_position = get_global_mouse_position()

func _input(event):
	if (event is InputEventMouseButton and event.is_pressed() and mouse_in_bounds()):
		drafted.emit(self)
	
func mouse_in_bounds() -> bool:
	var sprite_rect = $Sprite2D.get_rect()
	var pos = to_global(sprite_rect.position)
	
	var ref_rect = Rect2(pos, sprite_rect.size)
	
	return ref_rect.has_point(get_global_mouse_position())
