extends Spatial

func _input(event):
	if event is InputEventKey:
		var code = event.scancode
		var number = code - 49
		if code >= 49 and code <= 57 and number <= Pack.lenght()-1:
			Global.gui_root.use(number)
