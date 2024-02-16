extends Vegetable
var day_counter : int = 0
func initialise():
	pass

func effect(adjacent : Array, onDayChanged : bool):
	if onDayChanged:
		day_counter += 1
	if day_counter == 2:
		day_counter = 0
		sell_price += 1
