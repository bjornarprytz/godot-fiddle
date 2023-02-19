extends PointLight2D


func _ready():
	var tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	
	tween.tween_property(self, 'scale', Vector2(0,0), 2.0)
	tween.tween_callback(queue_free)
