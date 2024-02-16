extends Control

@onready var score = $ColorRect/Score

# Called when the node enters the scene tree for the first time.
func _ready():
	score.text = "Score : " + str(GlobalInfo.numberOfFight)
