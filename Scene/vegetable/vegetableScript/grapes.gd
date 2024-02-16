extends Vegetable

var nbOfFight : int = 0
var nbOfBoost : int = 0
func _ready():
	current_growState = 0
	growth_progress_bar.max_value = growing_time
	var new_stat_catastrophe = stat_catastrophe
	new_stat_catastrophe["EARTHQUAKE"] = 0
	new_stat_catastrophe["FIRE"] = 0
	new_stat_catastrophe["TORNADO"] = 0
	new_stat_catastrophe["TSUNAMI"] = 0
	nbOfFight = GlobalInfo.numberOfFight 

func effect(adjacent : Array, onDayChanged : bool):
	if onDayChanged:
		nbOfBoost = GlobalInfo.numberOfFight - nbOfFight 
		new_stat_catastrophe["EARTHQUAKE"] = nbOfBoost * 4
		new_stat_catastrophe["FIRE"] = nbOfBoost * 4
		new_stat_catastrophe["TORNADO"] = nbOfBoost * 4
		new_stat_catastrophe["TSUNAMI"] = nbOfBoost * 4



