extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func add_card(card: DraftCard):
	
	card.reparent($Pile)
	
	var tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property(card, 'position', Vector2(0, $Pile.get_child_count() * 20), 0.5)
