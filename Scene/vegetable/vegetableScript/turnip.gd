extends Vegetable

func _ready():
	current_growState = 0
	stat_catastrophe = [1,2,3,4]
	pass

func effect(adjacent : Array):
	var new_stat : Array = stat_catastrophe.duplicate()
	for element in adjacent:
		if element == []:
			new_stat[3] += 2
	new_stat_catastrophe = new_stat



