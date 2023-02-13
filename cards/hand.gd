extends Node2D

const card_spacing = 20
const card_width = 192


func _on_child_entered_tree(node):
	
	var total_width = (card_spacing + card_width)
	
	node.position = Vector2(-total_width, 0)
	var target = Vector2((get_child_count() -1) * total_width, 0)
	
	
	
	var tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	
	tween.tween_property(node, 'position', target, 0.5)
	tween.tween_property(node, 'rotation', PI*2, 1.0)
