extends KinematicBody2D

var speed = 125
var xp = 20
var dano = 20

# tempo de ataque
var tataque = 1.0

# distancia de ataque por pixel
var dataque = 100

# distancia de perseguição
var dpers = 400

# facilitador para trabalhar com o timer
onready var timer = $Timer

# facilitador para trabalhar com o player
onready var alvo = get_node("/root/Main/Player")

func _ready():
	timer.wait_time = tataque
	timer.start()
	
func _physics_process(delta):
	var dist = position.distance_to(alvo.position)
	if dist > dataque and dist < dpers:
		var vel = (alvo.position - position).normalized()
		move_and_slide(vel * speed)


func _on_Timer_timeout():
	if position.distance_to(alvo.position) <= dataque:
		alvo.toma_dano(dano)
		
func morre():
	alvo.toma_xp(xp)
	queue_free()
