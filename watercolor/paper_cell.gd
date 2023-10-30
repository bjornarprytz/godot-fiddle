extends Sprite2D
class_name PaperCell

@export var capacity : float

# use this while resolving water movement
var pending_pigments : Color 
var pending_water : float 

var free_water : float
var free_pigments : Color
var flow : Vector2

var saturation : float
var ingrained_pigments : Color

func update_color() -> void:
	if (free_water > 0.0):
		modulate = free_pigments

func flow_in(pigment : Color, water : float) -> void:
	free_pigments += pigment
	free_water += water

func flow_out(neighbours:Array[PaperCell]) -> void:
	if (free_water == 0.0):
		return
	
	var receptive_neighbours = neighbours.filter(func(c : PaperCell): return c != null) as Array[PaperCell]
	
	var escaping_water_per_neighbour = free_water / (receptive_neighbours.size() +1)
	var escaping_pigment_per_neighbour = free_pigments / (receptive_neighbours.size() +1)
	
	for n in receptive_neighbours:
		# Add threshold for flowing to dry neighbours
		
		n.pending_water += escaping_water_per_neighbour
		n.pending_pigments += escaping_pigment_per_neighbour
		# TODO: Update flow
		
		pending_water -= escaping_water_per_neighbour
		pending_pigments -= escaping_pigment_per_neighbour
		# TODO: Update flow

func lock_pending():
	free_pigments += pending_pigments
	pending_pigments = Color(0,0,0)
	free_water += pending_water
	pending_water = 0.0
	
	update_color()
	
