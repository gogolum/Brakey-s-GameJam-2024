extends Vegetable
func _ready():
	current_growState = 0
	growth_progress_bar.max_value = growing_time
	new_stat_catastrophe = stat_catastrophe
var elementList : Array = []

func initialise():
	pass
	
func effect(adjacent : Array, onDayChanged : bool):
	var new_stat : Dictionary = stat_catastrophe.duplicate()
	for element in adjacent:
		if element != []:
			if  !elementList.has(element[0]):
				element[0].growing_time = element[0].growing_time*2
				elementList.append(element[0])
			if element[0].isGrown():
				new_stat["EARTHQUAKE"] += 3
				new_stat["FIRE"] += 3
				new_stat["TORNADO"] += 3
				new_stat["TSUNAMI"] += 3
				pass
	new_stat_catastrophe = new_stat
