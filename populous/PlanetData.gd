@tool
extends Resource

class_name PlanetData

## Defines the planet's surface level
@export var planet_noise : Array[PlanetNoise] :
	get:
		return planet_noise
	set(value):
		planet_noise = value
		changed.emit()
		for n in planet_noise:
			if n != null and not n.changed.is_connected(_on_data_changed):
				n.changed.connect(_on_data_changed)

## Defines the color on different heights
@export var planet_color : GradientTexture1D :
	get:
		return planet_color
	set(value):
		planet_color = value
		changed.emit()
		if planet_color != null and not planet_color.changed.is_connected(_on_data_changed):
			planet_color.changed.connect(_on_data_changed)

## Radius of the planet
@export var radius : float = 1.0 :
	get:
		return radius
	set(value):
		radius = value
		changed.emit()

## The number of squares per face will be resolution x resolution
@export var resolution : int = 5 :
	get:
		return resolution
	set(value):
		resolution = value
		changed.emit()

var min_height : float = 99999.0 
var max_height : float = 0.0

		
func point_on_planet(point_on_sphere : Vector3) -> Vector3:
	var elevation : float = 0.0
	var base_elevation := 0.0
	if (planet_noise.size() > 0 and planet_noise[0] != null):
		base_elevation = planet_noise[0].calculate_elevation(point_on_sphere)
	
	for n in planet_noise:
		if n == null:
			continue
		
		var mask = 1.0
		if n.use_first_layer_as_mask:
			mask = base_elevation
		elevation += (n.calculate_elevation(point_on_sphere) * mask)
	
	return point_on_sphere * radius * (elevation + 1.0)
	

func _on_data_changed():
	min_height = 99999.0 
	max_height = 0.0
	changed.emit()
