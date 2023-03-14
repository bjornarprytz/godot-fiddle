extends Node

var loading_screen = preload("res://loading-screen.tscn")

func _unhandled_key_input(event: InputEvent) -> void:
	if (event is InputEventKey and event.is_pressed() and event.keycode == KEY_ESCAPE):
		get_tree().change_scene_to_file("res://menu.tscn")

func load_scene(current_scene : Node, next_scene_path : String):
	var loading_screen_instance = loading_screen.instantiate() as LoadingScreen
	
	current_scene.queue_free()
	
	ResourceLoader.load_threaded_request(next_scene_path)
	
	var progress = []
	
	var result = ResourceLoader.load_threaded_get_status(next_scene_path, progress)
	
	while result == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
		loading_screen_instance.update_progress(progress[0])
		result = ResourceLoader.load_threaded_get_status(next_scene_path, progress)
	
	if (result == ResourceLoader.THREAD_LOAD_LOADED):
		var next_scene = ResourceLoader.load_threaded_get(next_scene_path)
		get_tree().change_scene_to_packed(next_scene)
