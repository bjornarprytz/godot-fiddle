extends Node2D
class_name Card


signal onHoverStart
signal onHoverEnd

var anchor = Vector2(0,0)

var frame : Sprite2D
var fsm : StateMachine
var cardName : String = "Name"

func _ready() -> void:
	frame = $Frame as Sprite2D
	fsm = $StateMachine as StateMachine

func mouse_in_bounds() -> bool:
	var sprite_rect = $Frame.get_rect()
	var pos = to_global(sprite_rect.position)
	
	var ref_rect = Rect2(pos, sprite_rect.size)
	
	return ref_rect.has_point(get_global_mouse_position())

func update_ui():
	$Title.text = cardName

func _on_interaction_mouse_entered() -> void:
	onHoverStart.emit()

func _on_interaction_mouse_exited() -> void:
	onHoverEnd.emit()
