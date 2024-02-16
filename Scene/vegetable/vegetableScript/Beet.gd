extends Vegetable

func initialise():
	pass
	
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
			
