extends Vegetable
func _ready():
	current_growState = 0
	growth_progress_bar.max_value = growing_time
	new_stat_catastrophe = stat_catastrophe

func effect(adjacent : Array, onDayChanged : bool):
	pass
