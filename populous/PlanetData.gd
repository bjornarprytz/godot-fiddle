@tool
extends Resource

class_name PlanetData

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
		
