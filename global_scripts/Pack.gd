extends Node

var all = {}
var max_size = 7

func add(key, label, icon = '', count = 1):
	if all.has(key):
		all[key].count += count
	elif len(all) <= max_size:
		all[key] = {
			'key' : key,
			'label' : label,
			'count' : count,
			'icon' : icon
		}
	
	Global.gui_root.update_inventory()

func get(key):
	return all[key] if all.has(key) else null

func count(key):
	return all[key].count if all.has(key) else 0

func has(key):
	return all.has(key)

func lenght():
	return len(all)

func remove(key, count = 1):
	if has(key):
		all[key].count -= count
		if all[key].count < 1:
			all.erase(key)

func full_remove(key):
	all.erase()

func get_all():
	return all
