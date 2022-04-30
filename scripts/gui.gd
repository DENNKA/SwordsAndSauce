extends Control

func _ready():
	Pack.gui_root = self
	update()

func update():
	remove()

	for _cell in Pack.get_all():
		var cell = preload("res://scenes/inventory_cell.tscn").instance()
		$inventory/panel/grid.add_child(cell)
		cell.get_child(0).text = String(Pack.all[_cell].count)

func remove():
	for cell in $inventory/panel/grid.get_children():
		$inventory/panel/grid.remove_child(cell)
		cell.queue_free()
