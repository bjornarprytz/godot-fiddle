extends Node2D
class_name Card

var held = false
var origin: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (held):
		global_position = get_global_mouse_position()

func _input(event):
	if (event is InputEventMouseButton and mouse_in_bounds()):
		
		var wasHeld = held
		held = event.is_pressed()
		
		if (wasHeld != held):
			if (held):
				origin = position
			else:
				var tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
				tween.tween_property(self, 'position', origin, 0.8)
			
	
func mouse_in_bounds() -> bool:
	var sprite_rect = $Sprite2D.get_rect()
	var pos = to_global(sprite_rect.position)
	
	var ref_rect = Rect2(pos, sprite_rect.size)
	
	return ref_rect.has_point(get_global_mouse_position())
