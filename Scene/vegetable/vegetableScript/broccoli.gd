extends Vegetable

func initialise():
	pass
	
func effect(adjacent : Array, onDayChanged : bool):
	var new_stat : Dictionary = stat_catastrophe.duplicate()
	for element in adjacent:
		if element != []:
			if element[0].type == "sun" or element[0].type == "underground" and element[0].isGrown():
				new_stat["TSUNAMI"] += 6
				pass
	new_stat_catastrophe = new_stat

