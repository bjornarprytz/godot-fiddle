extends Node2D

@onready var paper : PaperMap = $PaperMap

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	var tween = create_tween().set_loops()
	
	tween.tween_callback(loop_iteration)
	tween.tween_interval(0.2)

func _process(delta: float) -> void:
	if (randf() > 0.8):
		paint_random_cell()

func paint_random_cell():
	var r_x = randi_range(0, paper.paper_size.x-1)
	var r_y = randi_range(0, paper.paper_size.y-1)
	
	var cell = paper.get_cell(r_x, r_y)
	
	cell.flow_in(Color.RED, 100.0)
	cell.update_color()

func loop_iteration():
	paper.water_flow()
	paper.update_flow()
	paper.dissipate_water()
