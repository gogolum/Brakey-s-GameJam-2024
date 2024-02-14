extends Vegetable

func effect(adjacent : Array):
	new_stat_catastrophe = stat_catastrophe
	for element in adjacent:
		if element == null:
			new_stat_catastrophe[3] += 2
			pass
		pass
	pass
