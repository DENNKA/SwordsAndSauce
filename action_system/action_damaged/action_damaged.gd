extends Area

var type = 'action'
var something_is_there = false

export var use_frequency = true
export var damage_frequency = 1.0

export var stats = {
	'key' : '',
	'count': 0
}

func action(body):
	body.damage(stats['count'])
#	while (something_is_there):
#		body.damage(stats['count'])
#		if use_frequency:
#			yield(get_tree().create_timer(damage_frequency), "timeout")
#		else:
#			something_is_there = false 
#			break

func _on_action_damaged_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.has_method("damage"):
		something_is_there = true
		action(body)


func _on_action_damaged_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if body.has_method("damaged"):
		something_is_there = false
