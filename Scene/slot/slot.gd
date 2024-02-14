extends TextureRect

var on_plot : bool = false

func _process(_delta):
	if GlobalInfo.hoovered_plot != self:
		self_modulate = Color(0.325, 0.227, 0.09)
	else :
		self_modulate = Color(0.682, 0.498, 0.247)
		
		

func _on_mouse_exited():
	if not Rect2(Vector2(), size).has_point(get_local_mouse_position()):
		GlobalInfo.hoovered_plot = null
	pass # Replace with function body.


func _on_mouse_entered():
	GlobalInfo.hoovered_plot = self
