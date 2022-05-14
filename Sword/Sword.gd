extends Spatial

onready var player := get_tree().get_root().get_node("Test_Level").get_node("Player")
onready var player_model := player.get_node("Mesh")
onready var hand := player.find_node("Hand")

func _ready():
	connect("body_entered", self, "_on_collision")

func _process(delta):
	var hand_pos = hand.global_transform.origin

	global_transform.origin = hand_pos
	rotation = player_model.rotation + Vector3(0, 0, -3.14/2)
