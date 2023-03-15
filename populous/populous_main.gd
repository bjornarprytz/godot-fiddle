extends Node3D

func _physics_process(delta: float) -> void:
	$Camera3D.look_at($Player.position)
