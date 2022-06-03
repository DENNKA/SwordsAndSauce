extends Entity

onready var enemys_range = Global.enemys_in_range
onready var camera = $"Camera_root/cam_h/cam_v/Camera"
onready var target_cam = $"Target_сamera_root/cam_h/cam_v/TargetCam"
onready var main_cam = $"Camera_root/cam_h/cam_v/Camera"
onready var target_camera_h = $"Target_сamera_root/cam_h"

var mesh
var player
var camera_h

var self_postion = Vector3.ZERO
var dodge_dir = Vector3.ZERO

func _ready():
	mesh = get_node("Body")
	camera_h = get_node("Camera_root/cam_h")
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _physics_process(delta):
	move(delta)
	action()

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

	if direction && !is_dodge:
		direction *= movement * delta
		if main_cam.current:
			direction = direction.rotated(Vector3.UP, camera_h.rotation.y)
		else:
			direction = direction.rotated(Vector3.UP, target_camera_h.rotation.y)
		mesh.rotation.y = lerp_angle(turning.y, -atan2(direction.z, direction.x), 0.25)
		turning.y = mesh.rotation.y
		$"Body/PlayerMesh/AnimationPlayer".play("walk")
	else:
		$"Body/PlayerMesh/AnimationPlayer".play("idle")

	mover(delta)

	if Input.is_action_just_pressed("jump"):
		jump()

	if Input.is_action_just_pressed("dodge"):
		is_dodge = true

	if is_dodge:
		self_postion = self.global_transform.origin
		dodge_dir = $"Body/Dodger".global_transform.origin
		global_transform.origin.x = lerp(self_postion.x, dodge_dir.x, 0.5)
		global_transform.origin.z = lerp(self_postion.z, dodge_dir.z, 0.5)
		yield(get_tree().create_timer(0.2), "timeout")
		is_dodge = false

	if !is_dodge:
		velocity = move_and_slide(velocity, Vector3.UP, true)

func action():
	if Input.is_action_just_pressed("use") && Global.action_object:
		Global.action_object.call('action')

	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		attack()

	if Input.is_action_just_pressed("target") && enemys_range != null && enemys_range.size() > 0:
		if main_cam.current:
			target_cam.current = true
		else:
			main_cam.current = true
		target_cam.targeting()
