extends Node2D


var field_spawned = preload("res://cross_language/field.tscn")

var backend = load("res://cross_language/Board.cs")

var board_state
var turn = "O"

# Called when the node enters the scene tree for the first time.
func _ready():
	board_state = backend.new()
	
	for y in range(1, 4):
		for x in range(1, 4):
			var field = field_spawned.instantiate() as Field
			field.X = x
			field.Y = y
			field.connect('pressed', mark.bind(field))
			$GridContainer.add_child(field)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func mark(field: Field):
	var f = board_state.Mark(field.X, field.Y, turn)
	field.set_mark(f.Mark)
	
	var result = board_state.GetResult()
	
	if (result != ""):
		for fieldButton in $GridContainer.get_children():
			fieldButton.disabled = true
			if (fieldButton.mark == result):
				fieldButton.modulate = Color.GREEN
			elif (fieldButton.mark != ""):
				fieldButton.modulate = Color.RED
				
	
	if (turn == "O"):
		turn = "X"
	else:
		turn = "O"
