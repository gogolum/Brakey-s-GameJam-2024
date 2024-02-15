extends Node2D

@onready var main_icon_rect = $NextAttacks/MainIconRect
@onready var secondary_icon_rect = $NextAttacks/SecondaryIconRect
@onready var sub_icon_rect_2 = $NextAttacks/SubIconRect2
@onready var sub_icon_rect = $NextAttacks/SubIconRect

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#generate_monster_stats(1)
	#print(GlobalInfo.global_monster_stats)
	
func generate_order():
	
	var icon_dict = GlobalInfo.global_stat_icons
	var icon_names = GlobalInfo.global_stat_icons_name
	var final_textures : Dictionary = {}
	
	#shuffle the list to randomize it
	icon_names.shuffle()
	
	for i in range(len(icon_names)):
		final_textures[icon_names[i]] = icon_dict[icon_names[i]]
		
	apply_next_fight_textures(final_textures)
	
	return final_textures

func apply_next_fight_textures(textures : Dictionary):
	
	#texture list
	var texture_list = []
	
	for element in textures:
		texture_list.append(textures[element])
	
	main_icon_rect.get_node("TextureRect").texture = texture_list[0]
	secondary_icon_rect.get_node("TextureRect").texture = texture_list[1]
	sub_icon_rect_2.get_node("TextureRect").texture = texture_list[2]
	sub_icon_rect.get_node("TextureRect").texture = texture_list[3]
	
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
	
	GlobalInfo.global_monster_stats = {}
	var texture_list = generate_order()
	var list_incrementation = 0
	for element in texture_list:
		GlobalInfo.global_monster_stats[element] = final_monster_stats[list_incrementation]
		list_incrementation += 1
	
	#creation of an array to reverse the dict
	var reversed_list = []
	var reversed_dict = {}
	for element in GlobalInfo.global_monster_stats:
		reversed_list.append(element)
	reversed_list.reverse()
	for element in reversed_list :
		reversed_dict[element] = GlobalInfo.global_monster_stats[element]
	
	GlobalInfo.global_monster_stats = reversed_dict
	
func get_stat_dictionnary():
	pass

func _ready():
	generate_monster_stats(GlobalInfo.numberOfFight)
