extends Node2D
class_name Picks

signal card_picked(card: DraftCard)

var card_factory = preload("res://draft/card_draft.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func clear_picks():
	for c in $Pick1.get_children():
		c.dissolve()
	await get_tree().create_timer(randf_range(0.1, 0.3)).timeout
	for c in $Pick2.get_children():
		c.dissolve()
	await get_tree().create_timer(randf_range(0.1, 0.3)).timeout
	for c in $Pick3.get_children():
		c.dissolve()
	
	
	
func load_picks():
	_load_card($Pick1)
	await get_tree().create_timer(0.5).timeout
	_load_card($Pick2)
	await get_tree().create_timer(0.5).timeout
	_load_card($Pick3)

func _load_card(target: Node2D):
	var card = card_factory.instantiate() as DraftCard
	var start_pos =  Vector2(-100.0, get_viewport_rect().size.y / 3)
	target.add_child(card)
	card.global_position = start_pos
	
	card.drafted.connect(_card_picked, CONNECT_ONE_SHOT)
	
	var tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	
	await tween.tween_property(card, 'position', Vector2(0,0), 1.0).finished


func _card_picked(card:DraftCard):
	card_picked.emit(card)
