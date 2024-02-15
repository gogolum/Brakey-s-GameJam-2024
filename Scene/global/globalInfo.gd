extends Node

var vegetables : Dictionary = {
	'TOMATO' : preload("res://Scene/vegetable/vegetables/tomato.tscn"),
	'WHEAT' : preload("res://Scene/vegetable/vegetables/wheat.tscn"),
	'TURNIP' : preload("res://Scene/vegetable/vegetables/turnip.tscn"),
	'RUTABAGA' : preload("res://Scene/vegetable/vegetables/rutabaga.tscn"),
	'PUMPKIN' : preload("res://Scene/vegetable/vegetables/pumpkin.tscn"),
	'POTATO' : preload("res://Scene/vegetable/vegetables/potato.tscn"),
	#'ONION' : preload("res://Scene/vegetable/vegetables/onion.tscn"),
	'MANGO' : preload("res://Scene/vegetable/vegetables/mango.tscn"),
	'LETTUCE' : preload("res://Scene/vegetable/vegetables/lettuce.tscn"),
	'JALAPENO' : preload("res://Scene/vegetable/vegetables/jalapeno.tscn"),
	'GRAPES' : preload("res://Scene/vegetable/vegetables/grapes.tscn"),
	'CHERRY' : preload("res://Scene/vegetable/vegetables/cherry.tscn"),
	'BROCCOLI' : preload("res://Scene/vegetable/vegetables/broccoli.tscn"),
	#'BEET' : preload("res://Scene/vegetable/vegetables/beet.tscn"),
	'BANANA' : preload("res://Scene/vegetable/vegetables/banana.tscn"),
	'APPLE' : preload("res://Scene/vegetable/vegetables/apple.tscn")
}

var hoovered_plot : TextureRect
var hoovered_vegetable : Vegetable

# gestion de l'argent entre les scenes
signal udpate_stat
var coin : int = 10:
	set(value):
		coin = value
		udpate_stat.emit()
		
#global stats for the grid
var global_stats : Dictionary = {
	"EARTHQUAKE" : 0,
	"FIRE" : 0,
	"TORNADO" : 0,
	"TSUNAMI" : 0
}

var global_stat_icons : Dictionary = {
	"EARTHQUAKE" : preload("res://Assets/icon/earthIcon.png"),
	"FIRE" : preload("res://Assets/door/fireIcon_resized.png"),
	"TORNADO" : preload("res://Assets/icon/tornadoIcon.png"),
	"TSUNAMI" : preload("res://Assets/icon/tsunamiIcon.png")
}

var global_stat_icons_name : Array = ["EARTHQUAKE", "FIRE", "TORNADO", "TSUNAMI"]

var global_boss_stats_data
var global_boss_stats_textures

var numberOfFight : int = 0
var global_monster_stats : Dictionary
#day système
signal changeDay
var dayCount : int = 1:
	set(value):
		dayCount = value
		changeDay.emit()

#permet d'update la grid
signal planted
signal growed
#systeme de vente de plante
var canSell

