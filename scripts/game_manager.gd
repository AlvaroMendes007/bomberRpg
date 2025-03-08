extends Node

var total_tesouros = 0

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	total_tesouros = rng.randi_range(5, 15)
	print(str(total_tesouros))
