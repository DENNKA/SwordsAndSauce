extends Area

onready var player := get_tree().get_root().get_node("Test_Level").get_node("Player")
onready var player_model := player.get_node("Mesh")
onready var hand := player.find_node("Hand")

var damage = 20

func _ready():
	monitoring = true
	connect("body_entered", self, "_on_collision")

func _on_collision(body):
	if body == player:
		return
	if body.has_method("damage"):
		body.damage(damage)

func _process(delta):
	var hand_pos = hand.global_transform.origin

	global_transform.origin = hand_pos
	rotation = player_model.rotation + Vector3(0, 0, -3.14/2)
