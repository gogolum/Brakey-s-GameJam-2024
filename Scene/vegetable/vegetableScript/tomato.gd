extends Vegetable
var dayCounter : int = 0
func initialise():
	new_stat_catastrophe["FIRE"] = 0
	pass

func effect(adjacent : Array, onDayChanged : bool):
	if onDayChanged == true:
		var is_empty : bool = true
		for element in adjacent:
			if element != []:
				is_empty = false
		if is_empty:
			dayCounter +=1
			if dayCounter == 2:
				new_stat_catastrophe["FIRE"] += 1
				dayCounter = 0


