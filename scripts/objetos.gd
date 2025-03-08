extends TileMap

const Tree1 = preload("res://scenes/Tree_1.tscn")
const Tree2 = preload("res://scenes/Tree_2.tscn")

func _on_Cima_body_entered(body):
	modulate = Color(0,0,0,4)
	
func _ready():
	var tree1 = get_used_cells_by_id(0)
	var tree2 = get_used_cells_by_id(1)
	testeTree1(tree1)
	testeTree2(tree2)

func testeTree1(tileArr):
	var tilePos
	for i in range (0, tileArr.size()):
		var newTeste = Tree1.instance()
		tilePos = map_to_world(tileArr[i])
		newTeste.set_position(tilePos)
		set_cell(tileArr[i].x, tileArr[i].y, -1)
		self.add_child(newTeste)

func testeTree2(tileArr):
	var tilePos
	for i in range (0, tileArr.size()):
		var newTeste = Tree2.instance()
		tilePos = map_to_world(tileArr[i])
		newTeste.set_position(tilePos)
		set_cell(tileArr[i].x, tileArr[i].y, -1)
		self.add_child(newTeste)
