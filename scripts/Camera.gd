extends InterpolatedCamera

var playerPosition = Vector3.ZERO

func _ready():
	playerPosition = get_node("../player/head").transform
	transform = playerPosition
	target = "../player/head"
