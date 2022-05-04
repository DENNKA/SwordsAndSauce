extends Control

func _ready():
	Global.gui_root = self
	update_inventory()
	for key in Stats.get_all():
		update_status(Stats.all[key].key, Stats.all[key].amount)

func update_inventory():
	remove()
	
	for _cell in Pack.get_all():
		var inventory_cell = preload("res://scenes/inventory_cell.tscn").instance()
		$inventory/panel/grid.add_child(inventory_cell)
		inventory_cell.get_child(0).text = String(Pack.all[_cell].count)

func remove():
	for inventory_cell in $inventory/panel/grid.get_children():
		$inventory/panel/grid.remove_child(inventory_cell)
		inventory_cell.queue_free()

func update_status(key, amount):
	var childs = $"Statistic".get_children()

	for child in childs:
		if child.name == key:
			child.get_child(0).text = key + " " + str(amount)
