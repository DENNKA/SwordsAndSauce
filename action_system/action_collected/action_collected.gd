extends Area

var type = 'action'

export var collection_item = {
	'key' : '',
	'count': ''
}

func action():
	if Stats.update_stats(collection_item['key'], collection_item['count']):
		get_parent().queue_free()

func _on_action_collected_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == 'Player':
		action()
