extends Vegetable

func initialise():
	pass

func effect(adjacent : Array, onDayChanged : bool):
	var new_stat : Dictionary = stat_catastrophe.duplicate()
	if onDayChanged:
		GlobalInfo.coin += 1
