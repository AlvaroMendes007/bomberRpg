extends KinematicBody2D

var speed = 250
var vidas = 100
var tesouros = 0
var interactDsit = 80
var vel = Vector2()
var facingDir = Vector2()
var meuxp = 10
onready var raycast = $RayCast2D
onready var anim = $AnimatedSprite

signal criabomba
signal ganhou

onready var ui = get_node("/root/Main/HUD")

func _ready():
	$tema.play()
	ui.atualizavidas(vidas)
	ui.atualizaxp(meuxp)
	ui.atualizatesouros(tesouros)

# funcao que roda 60 vezes por segundo
func _physics_process(delta):
	vel = Vector2()
	if Input.is_action_pressed("ui_up"):
		vel.y -= 1
		facingDir = Vector2(0, -1)
	if Input.is_action_pressed("ui_down"):
		vel.y += 1
		facingDir = Vector2(0, 1)
	if Input.is_action_pressed("ui_left"):
		vel.x -= 1 
		facingDir = Vector2(-1, 0)
	if Input.is_action_pressed("ui_right"):
		vel.x += 1
		facingDir = Vector2(1, 0)
	
	#normalizar significa que ele não pode receber 
	#valor x e y, ou seja, andar na diagonal
	vel = vel.normalized()
	move_and_slide(vel * speed, Vector2.ZERO)
	
	if Input.is_action_just_pressed("poebomba") and meuxp >= 10:
		$poebomba.play()
		toma_xp(-10)
		emit_signal("criabomba")
	
	if vel.x > 0:
		play_animation("direita")
	elif vel.x < 0:
		play_animation("esquerda")
	elif vel.y < 0:
		play_animation("cima")
	elif vel.y > 0:
		play_animation("baixo")
	elif facingDir.x == 1:
		play_animation("pdireita")
	elif facingDir.x == -1:
		play_animation("pesquerda")
	elif facingDir.y == 1:
		play_animation("pbaixo")
	elif facingDir.y == -1:
		play_animation("pcima")
		
func play_animation(anim_name):
	if anim.animation != anim_name:
		anim.play(anim_name)

func toma_tesouro(achado):
	$tesouro.play()
	tesouros += achado
	ui.atualizatesouros(tesouros)
	if tesouros == 6:
		$ganhou.play()
		emit_signal("ganhou")
	
func toma_xp(quanto):
	meuxp += quanto
	ui.atualizaxp(meuxp)
	
func toma_dano(dano):
	$dano.play()
	vidas -= dano
	ui.atualizavidas(vidas)
	if vidas <= 0:
		$morte.play()
		morre()

func morre():
	get_tree().reload_current_scene()

func rety():
	return position.y	

func retx():
	return position.x

func _on_musica_timeout():
	$tema.play()
