extends Node2D

const screen_edge_margin = 30

var edge_maker = preload("res://graph/graph-edge.tscn")
var node_maker = preload("res://graph/graph_node.tscn")


func _enter_tree():
	
	var timer = get_tree().create_timer(1.0)
	while (true):
		spawn_node()
		await timer.timeout
		timer = get_tree().create_timer(1.0)
		
	
	print ("done!")

func _input(event):
	if (event is InputEventMouseButton and event.is_pressed()):
		spawn_edge()
		
func spawn_node():
	var node = node_maker.instantiate()
	
	var rand_x = randi_range(screen_edge_margin, get_viewport_rect().size.x - screen_edge_margin)
	var rand_y = randi_range(screen_edge_margin, get_viewport_rect().size.y - screen_edge_margin)
	
	$Nodes.add_child(node)
	node.position = Vector2(rand_x, rand_y)
	
func spawn_edge():
	var nodeCount = $Nodes.get_child_count()
	if (nodeCount < 2):
		return
	
	var edge = edge_maker.instantiate() as Line2D 
	
	var sourceIdx = randi_range(0, nodeCount-1)
	var destIdx = randi_range(0, nodeCount-1)
	
	if (sourceIdx == destIdx):
		sourceIdx = (destIdx + 1) % nodeCount
		
	var source = $Nodes.get_child(sourceIdx)
	var destination = $Nodes.get_child(destIdx)
	
	$Edges.add_child(edge)
	edge.add_point(source.position)
	edge.add_point(destination.position)
	
