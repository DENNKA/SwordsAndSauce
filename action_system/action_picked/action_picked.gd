extends Area

var type = 'action'
var item

export var on_remove = false
export var on_remove_parent = true

export var pack_item = {
	'key' : '',
	'label': '',
	'icon': ''
}

func action():
	if pack_item.key:
		item = pack_item
		Pack.add(item.key, item.label, item.icon)
	
	if on_remove_parent:
		Global.action_object = null
		get_parent().queue_free()
	else:
		if on_remove:
			Global.action_object = null
			queue_free()

func _on_action_picked_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		Global.action_object = self

func _on_action_picked_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		Global.action_object = null
