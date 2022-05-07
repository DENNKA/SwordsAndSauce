extends Area

var type = 'action'
var player_is_there = false

export var damage_frequency = 1.0

export var collection_item = {
	'key' : '',
	'count': ''
}

func action():
	while (player_is_there):
		Stats.update_stats(collection_item['key'], collection_item['count'])
		yield(get_tree().create_timer(damage_frequency), "timeout")

func _on_action_damaged_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == 'Player':
		player_is_there = true
		action()


func _on_action_damaged_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if body.name == 'Player':
		player_is_there = false
		action()
