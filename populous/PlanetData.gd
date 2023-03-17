@tool
extends Resource

class_name PlanetData

## Defines the planet's surface level
@export var planet_noise : Array[PlanetNoise] :
	get:
		return planet_noise
	set(value):
		planet_noise = value
		_on_data_changed()
		for n in planet_noise:
			if n != null and not n.changed.is_connected(_on_data_changed):
				n.changed.connect(_on_data_changed)

@export var biomes : Array[PlanetBiome] = [] :
	get:
		return biomes
	set(value):
		biomes = value
		_on_data_changed()
		for b in biomes:
			if b != null and not b.changed.is_connected(_on_data_changed):
				b.changed.connect(_on_data_changed)

## Radius of the planet
@export var radius : float = 1.0 :
	get:
		return radius
	set(value):
		radius = value
		_on_data_changed()

## The number of squares per face will be resolution x resolution
@export var resolution : int = 5 :
	get:
		return resolution
	set(value):
		resolution = value
		_on_data_changed()

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

func update_biome_texture() -> ImageTexture:
	var image_texture = ImageTexture.new()
	var dyn_image = Image.new()
	
	var h : int = biomes.size()
	if h > 0:
		var data : PackedByteArray
		var w : int = biomes[0].gradient.width
		for b in biomes:
			data.append_array(b.gradient.get_date().get_data())
			
		dyn_image.create_from_data(w, h, false, Image.FORMAT_RGBA8, data)
		
		image_texture.create_from_image(dyn_image)
		image_texture.resource_name = "Biome Texture"
		
	return image_texture

func biome_percent_from_point(poin_on_unit_sphere : Vector3) -> float:
	var height_percent : float = (poin_on_unit_sphere.y + 1.0) / 2.0
	var biome_index : int = 0
	
	var num_biome : float = biomes.size()
	for i in num_biome:
		if biomes[i].start_height < height_percent:
			biome_index = i
		else:
			break
	return biome_index / max(1.0, num_biome - 1.0)

func _on_data_changed():
	min_height = 99999.0
	max_height = 0.0
	
	changed.emit()
