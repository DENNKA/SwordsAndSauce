extends Control

var number
var active_cell_key

func _ready():
	Global.gui_root = self
	update_inventory()
	for key in Stats.get_all():
		update_status(Stats.all[key].key, Stats.all[key].amount)

func update_inventory():
	remove()
	number = 1

	for _cell in Pack.get_all():
		var inventory_cell_scene = preload("res://scenes/inventory_cell.tscn").instance()
		$inventory/panel/grid.add_child(inventory_cell_scene)
		inventory_cell_scene.get_child(0).text = String(Pack.all[_cell].count)
		inventory_cell_scene.get_child(1).text = String(number)
		number += 1
	
	if active_cell_key != null:
		$inventory/panel/grid.get_child(active_cell_key).color =  Color( 0.65, 0.16, 0.16, 1 )

func remove():
	for inventory_cell in $inventory/panel/grid.get_children():
		$inventory/panel/grid.remove_child(inventory_cell)
		inventory_cell.queue_free()

func update_status(key, amount):
	var childs = $"Statistic".get_children()

	for child in childs:
		if child.name == key:
			child.get_child(0).text = key + " " + str(amount)

func use(key):
	if active_cell_key != null:
		$inventory/panel/grid.get_child(active_cell_key).reload_color()
	active_cell_key = key
	$inventory/panel/grid.get_child(active_cell_key).color =  Color( 0.65, 0.16, 0.16, 1 )
