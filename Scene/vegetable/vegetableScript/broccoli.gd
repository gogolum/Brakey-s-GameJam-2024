extends Vegetable

func effect(adjacent : Array):
	
	for n in adjacent:
		if adjacent[n].type == "sun" or adjacent[n].type == "fruit":
			stat_catastrophe[3] += 3
			pass
		pass
	
	pass
