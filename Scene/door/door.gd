extends Node2D

@onready var main_icon_rect = $UI/MainIconRect
@onready var secondary_icon_rect = $UI/SecondaryIconRect
@onready var sub_icon_rect_2 = $UI/SubIconRect2
@onready var sub_icon_rect = $UI/SubIconRect

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func generate_order():
	
	var icon_dict = GlobalInfo.global_stat_icons
	var icon_names : Array = []
	var final_textures : Array = []
	
	#get every name of every stat
	for element in icon_dict:
		icon_names.append(element)
	
	#shuffle the list to randomize it
	icon_names.shuffle()
	
	for i in range(len(icon_names)):
		final_textures.append(icon_dict[icon_names[i]])
	
	return final_textures

func apply_next_fight_textures(textures : Array):
	main_icon_rect.texture = textures[0]
	secondary_icon_rect = textures[1]
	sub_icon_rect_2 = textures[2]
	sub_icon_rect = textures[3]
	
func generate_monster_stats(appocalipse_day):
	
	var base_monster_stats = [[10,14],[6, 10],[4,6],[4,6]]
	
	#calculate coefficient
	var coefficient = 1.0
	for _i in range(appocalipse_day):
		coefficient += 0.2
	
	#calculate final monster stats for the given appocalipse_day
	var final_monster_stats = []
	
	for i in range(len(base_monster_stats)):
		final_monster_stats.append(int(float(randi_range(base_monster_stats[i][0], base_monster_stats[i][1])) * coefficient))
	
	return final_monster_stats
	
