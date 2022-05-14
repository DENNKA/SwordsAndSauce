extends Spatial

var opened = false

func action():
	if !opened:
		$AnimationPlayer.play("open")
		opened = true
	else:
		$AnimationPlayer.play_backwards("open")
		opened = false
