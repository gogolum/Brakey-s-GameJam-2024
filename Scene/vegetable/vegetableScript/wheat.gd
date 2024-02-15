extends Vegetable

func initialise():
	stat_catastrophe = [0,0,0,0]
	pass

func effect(adjacent : Array, onDayChanged : bool):
	var new_stat : Array = stat_catastrophe.duplicate()
	if onDayChanged:
		GlobalInfo.coin += 1
