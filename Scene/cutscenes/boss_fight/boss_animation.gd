extends Control

@onready var door_sprite = $CanvasLayer/Boss_Background/DoorSprite
@onready var boss_attacks_display = $CanvasLayer/BossAttacksDisplay


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
		return "you loose"
	elif door_life + life_point > 100:
		door_life = 100
	else :
		door_life += life_point

func compare(player_stat, boss_stat):
	#compare_animation()
	return player_stat - boss_stat


func _on_button_button_up():
	next_phase.emit()

func fight():
	#make list to hold all the catastrophies in order
	var catastrophies_list = []
	for element in GlobalInfo.global_monster_stats:
		catastrophies_list.append(element)
	
	update_attacks_display_slots(boss_fight_stage)
	await next_phase
	print(compare(GlobalInfo.global_monster_stats[catastrophies_list[0]], GlobalInfo.global_stats[catastrophies_list[0]]))
	


func _on_button_2_button_up():
	new_layout.generate_monster_stats(2)


func _on_button_3_button_up():
	fight()
