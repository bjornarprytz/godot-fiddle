@tool
extends Node3D

@export var planet_data : PlanetData :
	get:
		return planet_data
	set(value):
		planet_data = value
		if planet_data != null and not planet_data.changed.is_connected(on_data_changed):
			planet_data.changed.connect(on_data_changed)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	on_data_changed()

func on_data_changed():
	for child in $Faces.get_children():
		var face := child as PlanetMeshFace
		face.regenerate_mesh(planet_data)
