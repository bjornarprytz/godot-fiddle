extends Node
class_name PaperMap

@export var base_color : Color

@export var cell_size : int = 2
@export var paper_size : Vector2i = Vector2i(290, 210)

var cell_factory = preload("res://watercolor/paper_cell.tscn")
var cells : Array[PaperCell] = [] # for the 2d grid

func _ready():
	for x in paper_size.x:
		for y in paper_size.y:
			var c = cell_factory.instantiate() as PaperCell
			
			c.position = Vector2(cell_size * x, cell_size * y)
			c.modulate = base_color
			cells.push_back(c)
			add_child(c)
			

func get_cell(x : int, y : int) -> PaperCell:
	if (x < 0 or x >= paper_size.x or y < 0 or y >= paper_size.y):
		return null
	
	return cells[_cell_index(x, y)]

func _cell_index(x : int, y : int) -> int:
	return (x * paper_size.y) + (y)

func water_flow():
	for x in paper_size.x:
		for y in paper_size.y:
			var cell = get_cell(x, y)
			
			var n_north = get_cell(x-1, y)
			var n_east = get_cell(x, y+1)
			var n_south = get_cell(x+1, y)
			var n_west = get_cell(x, y-1)
			
			cell.flow_out([n_north, n_east, n_south, n_west])
					
	
func update_flow():
	for x in paper_size.x:
		for y in paper_size.y:
			var cell = get_cell(x, y)
			
			cell.lock_pending()
		
func dissipate_water():
	# Saturate and dissipate water
	pass
