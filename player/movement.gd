extends KinematicBody

## Speed:
const MOVEMENT = 300
const ROTATION = 3

var velocity = Vector3.ZERO
var direction = Vector3.ZERO

func action():
	if Global.action_object:
		Global.action_object.call('action')

func _physics_process(delta):
	
	direction = Vector3.ZERO
	
	if Input.is_action_pressed("move_right"):
		rotate_y(-ROTATION * delta)
	if Input.is_action_pressed("move_left"):
		rotate_y(ROTATION * delta)
	if Input.is_action_pressed("move_forward"):
		direction.x = 1
	if Input.is_action_pressed("move_back"):
		direction.x = -1
		
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		pass
	
	if direction:
		direction *= MOVEMENT * delta
		direction = direction.rotated(Vector3.UP, rotation.y)
	
	velocity.x = direction.x
	velocity.z = direction.z
	
	move_and_slide(velocity, Vector3.UP)

