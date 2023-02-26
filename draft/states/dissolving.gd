extends State

var dissolveMaterial = preload("res://shader/dissolve_material.tres").duplicate(true)

var dissolveShader = preload("res://shader/dissolve.gdshader")

var card : Card

func init():
	#dissolveMaterial.shader = dissolveShader
	#dissolveMaterial.set_shader_parameter('noise', NoiseTexture2D.new())
	#dissolveMaterial.set_shader_parameter('dissolveState', 0.0)
	#dissolveMaterial = _dissolveMaterial.duplicate(true)
	card = target as Card

func enter():
	card.frame.material = dissolveMaterial
	
	var tween = create_tween().set_trans(Tween.TRANS_LINEAR)
	await tween.tween_property(card.frame, "material:shader_parameter/dissolveState", 1.0, randf_range(0.5, 0.9)).finished
	
	card.queue_free()
