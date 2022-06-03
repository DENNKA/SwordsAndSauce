extends KinematicBody

class_name Entity

var health = 100
var max_health = 100

export(int) var movement = 7
export(int) var gravity = -20
export(int) var rotations = 8
export(int) var jump_force = 7

var velocity = Vector3.ZERO
var direction = Vector3.ZERO
var turning = Vector3.ZERO

var attack_timer

var is_attack = false
var is_dodge = false

func _ready():
	attack_timer = Timer.new()
	attack_timer.one_shot = true
	add_child(attack_timer)

func mover(delta):
	var vel = Vector3(direction.x, 0, direction.z).normalized() * movement
	if is_on_floor():
		velocity = Vector3(vel.x, 0, vel.z)
	else:
		velocity.y += gravity * delta
		velocity = Vector3(vel.x, velocity.y, vel.z)

func jump():
	if is_on_floor():
		velocity.y = jump_force

func attack():
	if attack_timer.time_left > 0.01:
		return
	print("attack")
	set_attack_animation()
#	$Sword.new_attack()
	is_attack = true
	attack_timer.start(1.0)

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
