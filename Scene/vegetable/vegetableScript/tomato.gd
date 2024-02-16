extends Vegetable
var dayCounter : int = 0
func _ready():
	current_growState = 0
	growth_progress_bar.max_value = growing_time
	var new_stat_catastrophe = stat_catastrophe
	new_stat_catastrophe["FIRE"] = 0
	print(self)


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
	new_stat_catastrophe["EARTHQUAKE"] = 2
	new_stat_catastrophe["TORNADO"] = 2
	new_stat_catastrophe["TSUNAMI"] = 2


