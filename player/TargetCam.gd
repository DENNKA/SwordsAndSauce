extends ClippedCamera

const ROT = 0.001

const max_v = -1
const min_v = 0.6

var turning_speed = 0.1

var target
var targeter

var camera_h
var camera_v

var turning = Vector3.ZERO

func _ready():
	targeter = get_node("../../../../mem")

	camera_h = get_node("../..")
	camera_v = get_node("..")

func _process(delta):
	if Global.target != null && current:
		targeter.look_at(target.global_transform.origin, Vector3.UP)
		look_at(target.global_transform.origin, Vector3.UP)
		camera_h.rotation_degrees.y = targeter.rotation_degrees.y + 92
		turning.y = camera_h.rotation_degrees.y
func targeting():
	Global.target = Global.enemys_in_range[0]
	target = Global.target
