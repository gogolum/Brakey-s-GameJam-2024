extends Vegetable
func _ready():
	current_growState = 0
	growth_progress_bar.max_value = growing_time
	new_stat_catastrophe = stat_catastrophe
func initialise():
	pass
	
func effect(adjacent : Array, onDayChanged : bool):
	var new_stat : Dictionary = stat_catastrophe.duplicate()
	for element in adjacent:
		if element != []:
			if element[0].isGrown():
				new_stat["EARTHQUAKE"] += 1
				new_stat["FIRE"] += 1
				new_stat["TORNADO"] += 1
				new_stat["TSUNAMI"] += 1
				pass
	new_stat_catastrophe = new_stat
