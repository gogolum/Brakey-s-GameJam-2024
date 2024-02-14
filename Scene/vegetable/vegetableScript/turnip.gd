extends Vegetable


# pas les bonnes stats
#[[],[turnip],[wheat],[]]
func effect(adjacent : Array):
	
	for element in adjacent:
		if element == null:
			stat_catastrophe[3] += 2
			pass
		pass
	
	pass
