extends State

var outlineMaterial = preload("res://shader/outline_material.tres") # .duplicate(true) is not needed because none of the shader properties are changed

var card : Card

var _isHovered = false

func init():
	card = target as Card

func enter():
	card.onHoverStart.connect(onHoverStart)
	card.onHoverEnd.connect(onHoverEnd)
	
func exit():
	card.onHoverStart.disconnect(onHoverStart)
	card.onHoverEnd.disconnect(onHoverEnd)
	card.frame.material = null
	_isHovered = false
	
func _input(event: InputEvent) -> void:
	if (_isHovered and event is InputEventMouseButton and event.is_pressed()):
		fsm.transition_to('Drafted')
	
func onHoverStart():
	card.frame.material = outlineMaterial
	_isHovered = true
	
func onHoverEnd():
	card.frame.material = null
	_isHovered = false
