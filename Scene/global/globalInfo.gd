extends Node

var vegetables : Dictionary = {
	'TOMATO' : preload("res://Scene/vegetable/vegetables/tomato.tscn")
}

var hoovered_plot : TextureRect

# gestion de l'argent entre les scenes
signal udpate_stat
var coin : int = 0:
	set(value):
		coin = value
		udpate_stat.emit()
