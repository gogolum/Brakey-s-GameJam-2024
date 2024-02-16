extends Control


var fullscreen_state : bool = true

func _on_tutorial_toggled(toggled_on):
	if toggled_on:
		$CenterContainer/VBoxContainer/Tutorial/Off.hide()
		$CenterContainer/VBoxContainer/Tutorial/On.show()
		GlobalInfo.tutorialOn = true
	if !toggled_on:
		$CenterContainer/VBoxContainer/Tutorial/Off.show()
		$CenterContainer/VBoxContainer/Tutorial/On.hide()
		GlobalInfo.tutorialOn = false
	pass # Replace with function body.


func _on_start_buton_button_up():
	get_tree().change_scene_to_file("res://Scene/main_level/main_level.tscn")
	pass # Replace with function body.




func _on_tutorial_button_up():
	if GlobalInfo.tutorialOn == true:
		$CenterContainer/VBoxContainer/Tutorial/Off.show()
		$CenterContainer/VBoxContainer/Tutorial/On.hide()
		GlobalInfo.tutorialOn = false
	else:
		$CenterContainer/VBoxContainer/Tutorial/Off.hide()
		$CenterContainer/VBoxContainer/Tutorial/On.show()
		GlobalInfo.tutorialOn = true
	pass # Replace with function body.


func _on_fullscreen_buton_button_down():
	if  fullscreen_state == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	fullscreen_state = !fullscreen_state
