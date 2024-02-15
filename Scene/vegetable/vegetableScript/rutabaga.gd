extends Vegetable

func initialise():
	pass
	
func effect(adjacent : Array, onDayChanged : bool):
	var new_stat : Dictionary = stat_catastrophe.duplicate()
	if onDayChanged:
		for element in adjacent:
			if element == []:
				GlobalInfo.coin += 2
	new_stat_catastrophe = new_stat
