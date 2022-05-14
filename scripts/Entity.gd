extends KinematicBody

class_name Entity

var health = 100
var max_health = 100

var is_attack = false

const MOVEMENT = 300
const GRAVITY = -20
const ROTATION = 4

var velocity = Vector3.ZERO
var direction = Vector3.ZERO
var turning = Vector3.ZERO

var attack_timer

func _ready():
	attack_timer = Timer.new()
	attack_timer.one_shot = true
	add_child(attack_timer)

func damage(damage_hp):
	assert(damage_hp > 0)
	health -= damage_hp
	if health < 0:
		health = 0
		die()

func heal(heal_hp):
	assert(heal_hp > 0)
	health += heal_hp
	if (health > max_health):
		health = max_health

func die():
	queue_free()

func set_attack_animation():
	pass

func attack():
	if attack_timer.time_left > 0.01:
		return
	set_attack_animation()
	$Sword.new_attack()
	is_attack = true
	attack_timer.start(1.0)

func _to_floor():
	if is_on_floor():
		velocity = Vector3(direction.x, 0, direction.z)
	else:
		velocity = Vector3(direction.x, GRAVITY, direction.z)
