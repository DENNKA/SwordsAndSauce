extends Area

onready var activate_objects = get_tree().get_nodes_in_group("Activate_objects")

export var activate_name = ["door_01","door_02"]
export var parent_function = false

func action():
	if parent_function:
		get_parent().action()
		yield($"../AnimationPlayer", "animation_finished")
	for object in activate_objects:
		if object.name in activate_name:
			object.action()
	
func _on_action_used_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		Global.action_object = self


func _on_action_used_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		Global.action_object = null
