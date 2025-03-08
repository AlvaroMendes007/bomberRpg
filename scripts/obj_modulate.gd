extends AnimatedSprite

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		self.modulate = "81ffffff"

func _on_Area2D_body_exited(body):
	if body.name == "Player":
		self.modulate = "ffffff"
