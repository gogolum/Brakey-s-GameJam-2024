extends Vegetable
func initialise():
	stat_catastrophe = [1,0,0,0]
	pass

func effect(adjacent : Array, onDayChanged : bool):
	if onDayChanged == true:
		var allGood : int = 0
		for element in adjacent:
			if element == []:
				allGood += 1
		if allGood == 4:
			new_stat_catastrophe[1] += 1


