extends Vegetable
var elementList : Array = []
func initialise():
	pass

func effect(adjacent : Array, onDayChanged : bool):
	
	new_stat_catastrophe["EARTHQUAKE"] = GlobalInfo.numberOfFight * 3
	new_stat_catastrophe["FIRE"] = GlobalInfo.numberOfFight * 3
	new_stat_catastrophe["TORNADO"] = GlobalInfo.numberOfFight * 3
	new_stat_catastrophe["TSUNAMI"] = GlobalInfo.numberOfFight * 3


