extends Control

func set_action_name(name):
	$action_name.text = name

func _ready():
	Global.root_gui = self

func _physics_process(delta):
	if !Global.action_object:
		set_action_name('')
	elif is_instance_valid(Global.action_object):
		if Global.action_object && 'action_name' in Global.action_object:
			set_action_name(Global.action_object.name)
