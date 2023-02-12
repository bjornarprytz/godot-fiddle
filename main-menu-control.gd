extends ColorRect

var tween

func _enter_tree():
	var targetColor = Color.from_string("5384f1", Color.WHITE)
		
	# https://easings.net/
	tween = create_tween()
	
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_QUAD)
	
	tween.tween_property(self, 'color', targetColor , 8.0)
	
	var button_tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_EXPO)
	
	button_tween.tween_property($Buttons, 'modulate:a', 255, 8.0)
