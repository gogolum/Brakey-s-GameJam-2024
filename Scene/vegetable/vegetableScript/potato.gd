extends Vegetable

func initialise():
	pass

func effect(adjacent : Array, onDayChanged : bool):
	var new_stat : Dictionary = stat_catastrophe.duplicate()
	for element in adjacent:
		if element != []:
			if element[0].type == "fruit" and element[0].isGrown():
				new_stat["EARTHQUAKE"] += 3
				new_stat["FIRE"] += 1
				pass
	new_stat_catastrophe = new_stat
