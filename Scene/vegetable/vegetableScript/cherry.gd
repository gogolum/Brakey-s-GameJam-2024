extends Vegetable

func _ready():
	current_growState = 0
	growth_progress_bar.max_value = growing_time
	new_stat_catastrophe = stat_catastrophe
func effect(adjacent : Array, onDayChanged : bool):
	var new_stat : Dictionary = stat_catastrophe.duplicate()
	for element in adjacent:
		if element != []:
			if element[0].vegetable_name == "wheat" or element[0].vegetable_name == "potato":
				
				if element[0].isGrown():
					new_stat["TORNADO"] += 5
					new_stat["FIRE"] += 5
		pass
	new_stat_catastrophe = new_stat
