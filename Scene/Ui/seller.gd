extends Control

func _process(delta):
	if GlobalInfo.canSell == true and GlobalInfo.hoovered_vegetable != null and GlobalInfo.hoovered_vegetable.picked_up == true:
		$TextureRect2.show()
		$price.show()
		$price.text = str(GlobalInfo.hoovered_vegetable.price)
	else:
		$TextureRect2.hide()
		$price.hide()



func _on_mouse_entered():
	GlobalInfo.canSell = true
	pass # Replace with function body.


func _on_mouse_exited():
	GlobalInfo.canSell = false
	pass # Replace with function body.
