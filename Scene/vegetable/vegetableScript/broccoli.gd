extends Vegetable

func effect(adjacent : Array):
	new_stat_catastrophe = stat_catastrophe
	for element in adjacent:
		if element.type == "sun" or element.type == "fruit":
			new_stat_catastrophe[3] += 3
