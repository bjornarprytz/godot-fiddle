extends Node2D
class_name Card

var anchor = Vector2(0,0)

func mouse_in_bounds() -> bool:
	var sprite_rect = $Sprite2D.get_rect()
	var pos = to_global(sprite_rect.position)
	
	var ref_rect = Rect2(pos, sprite_rect.size)
	
	return ref_rect.has_point(get_global_mouse_position())
