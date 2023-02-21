extends Node2D

const card_spacing = -40
const card_width = 192


func _on_child_entered_tree(node : Card):
	
	var total_width = (card_spacing + card_width)
	
	node.position = Vector2(-total_width, 0)
	print ("Set anchor")
	node.anchor = Vector2((get_child_count() -1) * total_width, 0)
	var target_rot = PI / 16 + ((get_child_count() - 3) * PI / 16)
	
	
	
	var tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	
	#tween.tween_property(node, 'anchor', target_pos, 0.5)
	tween.tween_property(node, 'rotation', target_rot, 0.4)
