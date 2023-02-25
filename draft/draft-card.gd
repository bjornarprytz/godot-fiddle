extends Node2D
class_name DraftCard

signal drafted(card :DraftCard)

var outline_shader_material = preload("res://shader/outline_material.tres")
var dissolve_shader_material = preload("res://shader/dissolve_material.tres")

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
	$Sprite.material = dissolve_shader_material
	
	# $Sprite.material.set_shader_parameter("dissolveState", 0.0) # Make sure it's not null
	var tween = create_tween().set_trans(Tween.TRANS_LINEAR)
	tween.tween_property($Sprite, "material:shader_parameter/dissolveState", 1.0, 1.0)
	await tween.tween_callback(queue_free).finished
	
func _on_area_2d_mouse_entered():
	$Sprite.material = outline_shader_material

func _on_area_2d_mouse_exited():
	$Sprite.material = null

