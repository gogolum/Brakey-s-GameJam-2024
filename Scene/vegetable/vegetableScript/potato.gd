extends Vegetable

func initialise():
	pass

func effect(adjacent : Array, onDayChanged : bool):
	if onDayChanged:
		sell_price += 1
