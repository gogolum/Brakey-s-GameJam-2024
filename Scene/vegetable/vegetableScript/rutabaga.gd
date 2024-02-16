extends Vegetable

func initialise():
	pass
	
func effect(adjacent : Array, onDayChanged : bool):
	if onDayChanged:
		for element in adjacent:
			if element == []:
				GlobalInfo.coin += 2

