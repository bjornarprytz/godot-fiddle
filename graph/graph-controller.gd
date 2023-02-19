extends Node2D

const nNodes = 10
const screen_edge_margin = 100

var edge_maker = preload("res://graph/graph-edge.tscn")
var node_maker = preload("res://graph/graph_node.tscn")


func _ready():
	for i in range(nNodes):
		spawn_node()
		await get_tree().create_timer(0.1).timeout

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
	
	var edge = edge_maker.instantiate() as EdgeLord 
	
	var sourceIdx = randi_range(0, nodeCount-1)
	var destIdx = randi_range(0, nodeCount-1)
	
	if (sourceIdx == destIdx):
		sourceIdx = (destIdx + 1) % nodeCount
		
	var source = $Nodes.get_child(sourceIdx) as GNode
	var destination = $Nodes.get_child(destIdx) as GNode
	
	if (source.neighbours.find(destination) != -1):
		print("Already neighbours!")
		return
	
	source.neighbours.append(destination)
	destination.neighbours.append(source)
	
	
	$Edges.add_child(edge)
	edge.go(source, destination)
	
	
