extends Node2D
class_name GNode

var neighbours : Array[GNode]  = []

func boom():
	$CPUParticles2D.emitting = true;
	hey()
	
func hey():
	$Sprite.modulate = Color.DARK_GREEN
