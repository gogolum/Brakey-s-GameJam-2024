extends Control
@onready var banner = $CanvasLayer2/Banner
@onready var shop = $CanvasLayer2/Shop
@onready var day_counter = $"CanvasLayer2/NextDayButton/day counter"
const BOSS_ANIMATION = preload("res://Scene/cutscenes/boss_fight/boss_animation.tscn")

@onready var door = $CanvasLayer2/Door

#fade effect animator
@onready var animation_player = $CanvasLayer2/FadeEffect/AnimationPlayer

#next day button
@onready var next_day_button = $CanvasLayer2/NextDayButton

#tutorial signal
signal next_tutorial_phase

func _ready():
	initialise()
	GlobalInfo.global_boss_stats_textures = door.generate_order()
	GlobalInfo.global_boss_stats_data = door.generate_monster_stats(0)
	door.apply_next_fight_textures(GlobalInfo.global_boss_stats_textures)
	if GlobalInfo.tutorialOn:
		tutorial()

func _process(delta):
	if GlobalInfo.hoovered_vegetable != null:
		banner.setBanner(GlobalInfo.hoovered_vegetable)
	
	if Input.is_action_just_pressed("skipScene"):
		next_tutorial_phase.emit()

func _on_button_pressed():
	$CanvasLayer2/ButtonClick.play()
	GlobalInfo.dayCount += 1
	day_counter.text = str(GlobalInfo.dayCount) + " day"
	animation_player.play("fade_next_day")
	next_day_button.disabled = true
	await get_tree().create_timer(0.5).timeout
	next_day_button.disabled = false
	shop.regenerate_shop()
	$CanvasLayer2/Score.text = "Score: " + str(GlobalInfo.numberOfFight)
	if GlobalInfo.dayCount == 8:
		GlobalInfo.numberOfFight += 1
		$CanvasLayer2.hide()
		var bossScene = BOSS_ANIMATION.instantiate()
		$FightScene.add_child(bossScene)
		GlobalInfo.global_boss_stats_data = bossScene.new_layout.generate_monster_stats(GlobalInfo.numberOfFight)
		bossScene.fight()
		
		GlobalInfo.global_boss_stats_textures = door.generate_order()
		door.apply_next_fight_textures(GlobalInfo.global_boss_stats_textures)
		
		GlobalInfo.dayCount = 1
		day_counter.text = str(GlobalInfo.dayCount) + " day"
		$CanvasLayer2/Score.text = "Score: " + str(GlobalInfo.numberOfFight)


func initialise():
	day_counter.text = str(GlobalInfo.dayCount) + " day"
	$CanvasLayer2/Score.text = "Score: " + str(GlobalInfo.numberOfFight)
	shop.regenerate_shop()
	GlobalInfo.coin = 20
	GlobalInfo.numberOfFight = 0

func tutorial():
	$Tutorial.show()
	
	for child in $Tutorial.get_children():
		child.show()
		await next_tutorial_phase
		child.hide()

	$Tutorial.hide()
