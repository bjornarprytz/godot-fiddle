@tool
extends Resource
class_name PlanetNoise

@export var noise_map : FastNoiseLite :
	get:
		return noise_map
	set(value):
		noise_map = value
		changed.emit()
		if noise_map != null and not noise_map.changed.is_connected(_on_data_changed):
			noise_map.changed.connect(_on_data_changed)

@export var amplitude : float = 1.0 :
	get:
		return amplitude
	set(value):
		amplitude = value
		changed.emit()

@export var min_height : float = 1.0 :
	get:
		return min_height
	set(value):
		min_height = value
		changed.emit()


@export var use_first_layer_as_mask : bool = false :
	get:
		return use_first_layer_as_mask
	set(value):
		use_first_layer_as_mask = value
		changed.emit()

func calculate_elevation(point_on_sphere: Vector3) -> float:
	if noise_map == null:
		return 0.0
	
	var level_elevation = noise_map.get_noise_3dv(point_on_sphere * 100.0)
	level_elevation = (level_elevation + 1.0) / 2.0 * amplitude
	level_elevation = max(0.0, level_elevation - min_height)
	return level_elevation

func _on_data_changed():
	changed.emit()
