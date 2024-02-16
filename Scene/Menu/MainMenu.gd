extends Control


var fullscreen_state : bool = false

func _ready():
	if !GlobalInfo.tutorialOn:
		$CenterContainer/VBoxContainer/Tutorial/Off.show()
		$CenterContainer/VBoxContainer/Tutorial/On.hide()
	else:
		$CenterContainer/VBoxContainer/Tutorial/Off.hide()
		$CenterContainer/VBoxContainer/Tutorial/On.show()

func _on_start_buton_button_up():
	get_tree().change_scene_to_file("res://Scene/main_level/main_level.tscn")
	pass # Replace with function body.




func _on_tutorial_button_up():
	if GlobalInfo.tutorialOn:
		$CenterContainer/VBoxContainer/Tutorial/Off.show()
		$CenterContainer/VBoxContainer/Tutorial/On.hide()
	else:
		$CenterContainer/VBoxContainer/Tutorial/Off.hide()
		$CenterContainer/VBoxContainer/Tutorial/On.show()
	GlobalInfo.tutorialOn = !GlobalInfo.tutorialOn


func _on_fullscreen_buton_button_down():
	if  fullscreen_state == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	fullscreen_state = !fullscreen_state
