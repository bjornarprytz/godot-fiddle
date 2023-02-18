extends ColorRect

var menu_scene = preload("res://menu.tscn")

var tween

func _ready():
	$Vignette.play()
	title_drop()

func title_drop():
	var target = get_viewport_rect().size.y / 2.0
	
	print("Target: ", target)
	
	# https://easings.net/
	tween = create_tween()
	
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_ELASTIC)
	
	tween.tween_property($Title, 'position:y', target , 7.7)
	tween.tween_callback(load_next)
	
	
func load_next():
	get_tree().change_scene_to_packed(menu_scene)
	
func _input(event):
	if (event.is_pressed()):
		load_next()
		
func _exit_tree():
	$Vignette.stop()
	if (tween):
		tween.kill()
