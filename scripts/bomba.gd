extends Area2D


func _ready():
	pass

func _on_Timer_timeout():
	queue_free()

func _on_bomba_body_entered(body):
	if body.name != "Player":
		$explode.play()
		$explosao.play()
		$AnimatedSprite.hide()
		$explosao.show()
		$explosao.animation = "explode"
		$Timer.start()
		body.morre()
