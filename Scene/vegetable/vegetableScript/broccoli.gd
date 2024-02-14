extends Vegetable

func _ready():
	stat_catastrophe = [0,2,0,0]

func effect(adjacent : Array):
	var new_stat_catastrophe : Array = stat_catastrophe.duplicate()
	for element in adjacent:
		if element != []:
			if element[0].type == "sun" or element[0].type == "fruit":
				new_stat_catastrophe[3] += 3


