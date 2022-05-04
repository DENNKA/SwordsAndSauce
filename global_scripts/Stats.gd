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
	var stat = all[key]
	if update(stat, amount):
		Global.gui_root.update_status(key, all[key].amount)
		return true
	else:
		return false

func update(stat, amount):
	var prev_amount = stat.amount
	stat.amount += int(amount)
	stat.amount = clamp(stat.amount, 0, stat.max_amount)
	return stat.amount != prev_amount

func get_all():
	return all
