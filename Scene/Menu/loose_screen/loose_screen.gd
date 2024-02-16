extends Control

@onready var score = $ColorRect/Score


func _ready():
	score.text = "Score : " + str(GlobalInfo.numberOfFight)

func _on_start_buton_button_up():
	if GlobalInfo.numberOfFight > 9:
		get_tree().change_scene_to_file("res://Scene/Menu/easter_egg/stephen_hawking.tscn")
	else:
		get_tree().change_scene_to_file("res://Scene/Menu/MainMenu.tscn")
