extends Node

var gui_root

var all = {}
var max_size = 7

func add(key, label, icon = '', count = 1):
	if all.has(key):
		all[key].count += count
	else:
		all[key] = {
			'key' : key,
			'label' : label,
			'count' : count,
			'icon' : icon
		}
	
	gui_root.update()

func get(key):
	return all[key] if all.has(key) else null

func count(key):
	return all[key].count if all.has(key) else 0

func has(key):
	return all.has(key)

func remove(key, count = 1):
	if has(key):
		all[key].count -= count
		if all[key].count < 1:
			all.erase(key)

func full_remove(key):
	all.erase()

func get_all():
	return all
