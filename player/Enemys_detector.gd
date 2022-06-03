extends Area

onready var enemys_range = Global.enemys_in_range

func _on_Area_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.has_method("damage") && body.name != "Player":
		enemys_range.append(body)
		print(enemys_range)

func _on_Area_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if body.has_method("damage") && body.name != "Player":
		enemys_range.remove(enemys_range.find(body))
	if body == Global.target:
		Global.target = null
