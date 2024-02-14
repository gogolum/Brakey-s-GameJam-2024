extends Vegetable
func _ready():
	stat_catastrophe = [1,2,3,4]
	pass

func effect(adjacent : Array):
	var new_stat_catastrophe : Array = stat_catastrophe.duplicate()
	for element in adjacent:
		if element == []:
			new_stat_catastrophe[3] += 2



