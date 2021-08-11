extends Node2D

var novabomba = preload("res://scenes/bomba.tscn")
var novoinimigo = preload("res://scenes/Inimigo.tscn")
var totalinimigos = 0

var novotesouro = preload("res://scenes/tesouro.tscn")
var tesourosnatela = 0

func _ready():
	randomize()
	set_camera_limits()

func _on_Player_criabomba():
	var bomba = novabomba.instance()
	add_child(bomba)
	bomba.position.x = $Player.retx()
	bomba.position.y = $Player.rety()
	
func set_camera_limits():
	var map_size = $solo.get_used_rect()
	var cell_size = $solo.cell_size
	$Camera2D.limit_left = map_size.position.x * cell_size.x
	$Camera2D.limit_top = map_size.position.y * cell_size.y
	$Camera2D.limit_right = map_size.end.x * cell_size.x
	$Camera2D.limit_bottom = map_size.end.y * cell_size.y

func _on_criainimigo_timeout():
	if totalinimigos < 20:
		var inimigo = novoinimigo.instance()
		add_child(inimigo)
		inimigo.position.x = rand_range(500, 4500)
		inimigo.position.y = rand_range(500, 4000)
		totalinimigos += 1

func _on_criatesouro_timeout():
	if tesourosnatela <= 7:
		var tesouro = novotesouro.instance()
		add_child(tesouro)
		tesouro.position.x = rand_range(500, 4500)
		tesouro.position.y = rand_range(500, 3500)
		tesourosnatela += 1

func _on_Player_ganhou():
	$HUD/Label.text = "Ganhou"
	$reinicio.start()

func _on_reinicio_timeout():
	get_tree().reload_current_scene()
