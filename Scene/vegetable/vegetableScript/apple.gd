extends Vegetable

func initialise():
	#stat_catastrophe = [,,,]
	pass
	
func effect(adjacent : Array, onDayChanged : bool):
	var new_stat : Dictionary = stat_catastrophe.duplicate()
	for element in adjacent:
		if element.type == "sun":
			new_stat["FIRE"] += 1
			pass
	new_stat_catastrophe = new_stat
