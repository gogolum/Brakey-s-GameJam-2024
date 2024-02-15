extends Control
@onready var banner = $CanvasLayer2/Banner
@onready var shop = $CanvasLayer2/Shop
@onready var day_counter = $"CanvasLayer2/NextDayButton/day counter"
const BOSS_ANIMATION = preload("res://Scene/cutscenes/boss_fight/boss_animation.tscn")
@onready var score = $CanvasLayer2/Score

func _ready():
	initialise()

func _process(delta):
	if GlobalInfo.hoovered_vegetable != null:
		banner.setBanner(GlobalInfo.hoovered_vegetable)


func _on_button_pressed():
	GlobalInfo.dayCount += 1
	day_counter.text = str(GlobalInfo.dayCount) + " day"
	shop.regenerate_shop()
	if GlobalInfo.dayCount == 7:
		var bossScene = BOSS_ANIMATION.instantiate()
		$FightScene.add_child(bossScene)
		bossScene.fight()
		GlobalInfo.dayCount = 1
		score.text = "Score: " + str(GlobalInfo.numberOfFight)



func initialise():
	day_counter.text = str(GlobalInfo.dayCount) + " day"
	shop.regenerate_shop()
	score.text = "Score: " + str(GlobalInfo.numberOfFight)
