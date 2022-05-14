extends Spatial

var stats = {
	'name' : 'enemy',
	'health' : 100,
	'max_health' : 100
}

func damaged(amount):
	stats['health'] += amount
	if stats['health'] <= 0:
		get_parent().queue_free()
	print(stats['health'])
