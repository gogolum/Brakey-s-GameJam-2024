extends Control

@onready var door_sprite = $CanvasLayer/Boss_Background/DoorSprite
@onready var boss_attacks_display = $CanvasLayer/BossAttacksDisplay

#player and monster labels
@onready var player_stat_label = $CanvasLayer/StatLabelContainer/PlayerStatLabel
@onready var monster_stat_label = $CanvasLayer/StatLabelContainer/MonsterStatLabel
@onready var stat_label_container = $CanvasLayer/StatLabelContainer

#result label
@onready var result_of_fight_container = $CanvasLayer/ResultOfFightContainer
@onready var result_label = $CanvasLayer/ResultOfFightContainer/ResultLabel

#door bar
@onready var door_life_bar = $CanvasLayer/LifeBar/DoorLifeBar

var boss_attacks = preload("res://Scene/door/door.tscn")

var boss_fight_stage = 0

var new_layout

var door_life = 100

signal next_phase

# Called when the node enters the scene tree for the first time.
func _ready():
	door_sprite.play("Idle")
	new_layout = boss_attacks.instantiate()
	new_layout.get_node("NextAttacks").get_node("IndicatorLabel").hide()
	new_layout.get_node("NextAttacks").get_node("PanelContainer").hide()
	boss_attacks_display.add_child(new_layout)
	
	#hide all the fights variable
	stat_label_container.hide()
	result_of_fight_container.hide()
	
	#sets the life of the bar 
	change_life(100)

func _process(delta):
	
	if Input.is_action_just_pressed("skipScene"):
		next_phase.emit()


func update_attacks_display_slots(stage):
	#get all icon panels
	var main_icon_panel = new_layout.get_node("NextAttacks").get_node("MainIconRect").get_node("Panel")
	var second_icon_panel = new_layout.get_node("NextAttacks").get_node("SecondaryIconRect").get_node("Panel")
	var sub_icon_panel = new_layout.get_node("NextAttacks").get_node("SubIconRect").get_node("Panel")
	var sub2_icon_panel = new_layout.get_node("NextAttacks").get_node("SubIconRect2").get_node("Panel")
	
	var current_stage_moduled = stage % 4
	if current_stage_moduled == 3:
		main_icon_panel.show()
		second_icon_panel.hide()
		sub_icon_panel.hide()
		sub2_icon_panel.hide()
	
	elif current_stage_moduled == 2:
		main_icon_panel.hide()
		second_icon_panel.show()
		sub_icon_panel.hide()
		sub2_icon_panel.hide()
		
	elif current_stage_moduled == 1:
		main_icon_panel.hide()
		second_icon_panel.hide()
		sub_icon_panel.hide()
		sub2_icon_panel.show()
		
	elif current_stage_moduled == 0:
		main_icon_panel.hide()
		second_icon_panel.hide()
		sub_icon_panel.show()
		sub2_icon_panel.hide()
	
func change_life(life_point):
	if door_life + life_point < 0:
		get_tree().quit()
	elif door_life + life_point > 100:
		door_life = 100
	else :
		door_life += life_point
	door_life_bar.value = door_life

func compare(player_stat, boss_stat):
	#compare_animation()
	return player_stat - boss_stat



func fight():
	
	for boss_fight_stage in range(4):
		#make list to hold all the catastrophies in order
		var catastrophies_list = []
		
		for element in GlobalInfo.global_monster_stats:
			catastrophies_list.append(element)
		
		update_attacks_display_slots(boss_fight_stage)
		
		stat_label_container.show()
		player_stat_label.text = str(GlobalInfo.global_stats[catastrophies_list[boss_fight_stage]])
		monster_stat_label.text = str(GlobalInfo.global_monster_stats[catastrophies_list[boss_fight_stage]])
		
		await next_phase
		
		stat_label_container.hide()
		result_of_fight_container.show()
		
		var result_of_fight = compare(GlobalInfo.global_stats[catastrophies_list[boss_fight_stage]], GlobalInfo.global_monster_stats[catastrophies_list[boss_fight_stage]])
		result_label.text = str(result_of_fight)
		
		if result_of_fight > 0 :
			result_label.modulate = Color(0, 0.831, 0)
		else :
			result_label.modulate = Color(0.949, 0, 0)
			change_life(result_of_fight)
		
		await next_phase
		
		result_of_fight_container.hide()
	$WinScreen.show()
	$CanvasLayer.queue_free()
	await next_phase
	GlobalInfo.numberOfFight += 1
	queue_free()
