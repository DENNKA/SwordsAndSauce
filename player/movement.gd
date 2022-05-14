extends KinematicBody

## Speed:
const MOVEMENT = 300
const GRAVITY = -20
const ROTATION = 4

var velocity = Vector3.ZERO
var direction = Vector3.ZERO
var turning = Vector3.ZERO

var mesh
var camera_h

func action():
	if Global.action_object:
		Global.action_object.call('action')

func _ready():
	mesh = get_node("Mesh")
	camera_h = get_node("camera_root/cam_h")
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	move(delta)
	jump()
	action_activate()

func move(delta):
	direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		direction.z = 1
	if Input.is_action_pressed("move_left"):
		direction.z = -1
	if Input.is_action_pressed("move_forward"):
		direction.x = 1
	if Input.is_action_pressed("move_back"):
		direction.x = -1

	if direction:
		direction *= MOVEMENT * delta
		direction = direction.rotated(Vector3.UP, camera_h.rotation.y)
		mesh.rotation.y = lerp_angle(turning.y, -atan2(direction.z, direction.x), delta * ROTATION)
		turning.y = mesh.rotation.y


	if is_on_floor():
		velocity = Vector3(direction.x, 0, direction.z)
	else:
		velocity = Vector3(direction.x, GRAVITY, direction.z)

	velocity = move_and_slide(velocity, Vector3.UP)

func jump():
	pass

func action_activate():
	if Input.is_action_just_pressed("use"):
		action()

func damaged(amount):
	Stats.update_stats('health', amount)
