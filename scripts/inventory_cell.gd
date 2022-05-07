extends ColorRect

var defolt_color
var cell_color

func _ready():
	defolt_color = self.color

func reload_color():
	color = defolt_color
