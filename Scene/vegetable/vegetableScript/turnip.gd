extends Vegetable

func initialise():
	pass

func effect(adjacent : Array, onDayChanged : bool):
	var new_stat : Dictionary = stat_catastrophe.duplicate()
	for element in adjacent:
		if element == []:
			new_stat["TSUNAMI"] += 2
	new_stat_catastrophe = new_stat




