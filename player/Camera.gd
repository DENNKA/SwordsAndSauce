extends ClippedCamera

const ROT = 0.001

const max_v = -1
const min_v = 0.6

var rot_x = 0
var rot_y = 0

var turning = Vector3.ZERO

var camera_h
var camera_v

func _ready():
	camera_h = get_node("../..")
	camera_v = get_node("..")

func _input(event):
	if event is InputEventMouseMotion:
		rot_y -= event.relative.x * ROT
		rot_x -= event.relative.y * ROT
		
		if rot_x >= min_v:
			rot_x = min_v
		elif rot_x <= max_v:
			rot_x = max_v
		
		camera_h.transform.basis = Basis(Vector3.UP, rot_y)
		camera_v.transform.basis = Basis(Vector3(0,0,1), rot_x)
