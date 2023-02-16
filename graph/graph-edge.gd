extends Line2D
class_name EdgeLord

var target : Vector2

func _process(delta):
	if (points.size() == 2):
		remove_point(1)
		add_point(target)

func go(source: GNode, destination: GNode):
	add_point(source.position)
	add_point(source.position)
	target = source.position
	source.hey()
	
	var p = points[1]
	var tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_EXPO)
	tween.tween_property(self, 'target', destination.position, 1.5)
	tween.tween_callback(destination.boom)
	
