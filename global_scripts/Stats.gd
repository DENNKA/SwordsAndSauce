extends Node

var all = {
	'health' : {
		'key' : 'health',
		'amount' : 19,
		'max_amount' : 100
	},
	'coins' : {
		'key' : 'coins',
		'amount' : 0,
		'max_amount' : 9999
	}
}

func update_stats(key, amount):
	if update(key, amount):
		Global.gui_root.update_status(key, all[key].amount)
		return true
	else:
		return false

func update(key, amount):
	if all[key].amount >= all[key].max_amount:
		return false
	else:
		all[key].amount += int(amount)
		all[key].amount = clamp(all[key].amount, 0, all[key].max_amount)
		return true

func get_all():
	return all
