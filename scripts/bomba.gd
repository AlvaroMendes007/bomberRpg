extends Area2D

func _on_Timer_timeout():
	queue_free()

func _on_bomba_body_entered(body):
	if body.name != "Player":
		explodir()
		body.morre()

func explodir():
	$explode.play()
	$explosao.play()
	$AnimatedSprite.hide()
	$explosao.show()
	$explosao.animation = "explode"
	$Timer.start()

func _on_TimerBombaInativa_timeout():
	explodir()
