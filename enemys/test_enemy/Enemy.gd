extends Entity

onready var player := get_tree().get_root().get_node("Test_Level").get_node("Player")

func _ready():
	pass

func _process(delta):
	var player_pos = player.global_transform.origin
	var vec2pos = Vector2(get_translation().x, get_translation().z)
	var vec2posPlayer = Vector2(player_pos.x, player_pos.z)
	var angle = (vec2pos - vec2posPlayer).angle()
	var distance = vec2pos.distance_to(vec2posPlayer)
	rotate_y(-angle - get_rotation().y)

	direction = Vector3.ZERO
	if distance > 0.1:
		direction.x = -1
	if distance < 0.7:
		attack()

	if direction:
		direction *= movement * delta
		direction = direction.rotated(Vector3.UP, rotation.y)

	mover(delta)

	velocity.x = direction.x
	velocity.z = direction.z

	move_and_slide(velocity, Vector3.UP)
