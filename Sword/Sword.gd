extends Area

onready var entity := get_parent()
onready var entity_model := entity.get_node("Mesh")
onready var hand := entity.find_node("Hand")

var damage = 20

var damaged_bodies = []

func new_attack():
	damaged_bodies.clear()

func _ready():
	pass

func _on_collision(body):
	if body == entity:
		return
	if body in damaged_bodies:
		return
	if entity.is_attack and body.has_method("damage"):
		body.damage(damage)
		damaged_bodies.append(body)

func _process(_delta):
	var hand_pos = hand.global_transform

	global_transform.origin = hand_pos.origin
	rotation = entity_model.rotation + hand.rotation

	for body in get_overlapping_bodies():
		_on_collision(body)
