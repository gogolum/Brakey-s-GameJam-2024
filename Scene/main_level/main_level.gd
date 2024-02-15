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


func _ready():
	initialise()
	GlobalInfo.global_boss_stats_textures = door.generate_order()
	GlobalInfo.global_boss_stats_data = door.generate_monster_stats(0)
	door.apply_next_fight_textures(GlobalInfo.global_boss_stats_textures)

func _process(delta):
	if GlobalInfo.hoovered_vegetable != null:
		banner.setBanner(GlobalInfo.hoovered_vegetable)


func _on_button_pressed():
	GlobalInfo.dayCount += 1
	day_counter.text = str(GlobalInfo.dayCount) + " day"
	animation_player.play("fade_next_day")
	next_day_button.disabled = true
	await get_tree().create_timer(0.5).timeout
	next_day_button.disabled = false
	shop.regenerate_shop()
	
	if GlobalInfo.dayCount == 8:
		$CanvasLayer2.hide()
		var bossScene = BOSS_ANIMATION.instantiate()
		$FightScene.add_child(bossScene)
		GlobalInfo.global_boss_stats_data = bossScene.new_layout.generate_monster_stats(1)
		bossScene.fight()
		
		GlobalInfo.global_boss_stats_textures = door.generate_order()


		door.apply_next_fight_textures(GlobalInfo.global_boss_stats_textures)
		
		GlobalInfo.dayCount = 1

		day_counter.text = str(GlobalInfo.dayCount) + " day"



func initialise():
	day_counter.text = str(GlobalInfo.dayCount) + " day"
	shop.regenerate_shop()

