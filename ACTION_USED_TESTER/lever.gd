extends Spatial

var activate = false

func action():
	if !activate:
		$AnimationPlayer.play("activate")
		activate = true
	else:
		$AnimationPlayer.play_backwards("activate")
		activate = false
