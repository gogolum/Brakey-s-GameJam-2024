extends Vegetable
func _ready():
	current_growState = 0
	growth_progress_bar.max_value = growing_time
	var new_stat_catastrophe = stat_catastrophe
	new_stat_catastrophe["EARTHQUAKE"] = 0

func effect(adjacent : Array, onDayChanged : bool):
	if onDayChanged == true:
		var is_sprout : bool = true
		for element in adjacent:
			if element == []:
				is_sprout = false
			if element != []:
				if element[0].isGrown():
					is_sprout = false
		if is_sprout:
			new_stat_catastrophe["EARTHQUAKE"] += 4
			
	new_stat_catastrophe["FIRE"] = 1
	new_stat_catastrophe["TORNADO"] = 1
	new_stat_catastrophe["TSUNAMI"] = 1
