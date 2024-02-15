extends Vegetable
var elementList : Array = []
func initialise():
	pass

func effect(adjacent : Array, onDayChanged : bool):
	
	for element in adjacent:
		if element != []:
			if !elementList.has(element[0]):
				if element[0].type == "underground":
					element[0].growing_time = element[0].growing_time/2
					elementList.append(element[0])

