@tool
extends Resource
class_name PlanetBiome


## Defines the color on different heights
@export var gradient : GradientTexture1D :
	get:
		return gradient
	set(value):
		gradient = value
		_on_data_changed()
		if gradient != null and not gradient.changed.is_connected(_on_data_changed):
			gradient.changed.connect(_on_data_changed)

@export var start_height : float :
	get:
		return start_height
	set(value):
		start_height = value
		_on_data_changed()



func _on_data_changed():
	changed.emit()
