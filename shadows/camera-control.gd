extends Camera2D

@export var player : Node2D

func _process(delta: float) -> void:
	position = lerp(position, player.position, delta)
