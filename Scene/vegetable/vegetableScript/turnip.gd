extends Vegetable


# pas les bonnes stats

func effect(adjacent : Array):
	
	for n in adjacent:
		if adjacent[n] == null:
			stat_catastrophe[3] += 2
			pass
		pass
	
	pass
