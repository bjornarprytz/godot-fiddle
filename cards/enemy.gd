extends Sprite2D

const maxHealth = 400
var health: int = maxHealth

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$HealthLabel.text = str(health) + " / " + str(maxHealth)

