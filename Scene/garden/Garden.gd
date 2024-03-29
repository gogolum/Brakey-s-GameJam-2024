extends GridContainer

#base variables for the grid
var grid_rows : int = 5
var grid_columns : int = 5

#base lists to manage the grid
var control_list : Array = []
var slot_list : Array = []

#slot packedscene
var slot_scene : PackedScene = load("res://Scene/slot/slot.tscn")

#generate grid function
func generate_grid(nb_rows : int, nb_columns : int):
	
	#sets number of columns
	self.columns = nb_columns
	
	#go through all rows and columns
	for i in range(nb_rows):
		
		#creates the control and slot lists
		control_list.append([])
		slot_list.append([])
		
		for j in range(nb_columns):
			
			#creates the control and slot list
			control_list[i].append([])
			slot_list[i].append([])
			
			#create new slot insance
			var new_slot = slot_scene.instantiate()
			add_child(new_slot)
			
			#add slot to slot list
			slot_list[i][j] = new_slot

#find all the adjacents slots next to some given coordinates
func get_adjacent_tiles(coordinates : Vector2):
	#sets variable to return
	var new_coords : Array = []
	
	if coordinates.x > 0:
		new_coords.append(control_list[coordinates.x - 1][coordinates.y])
	
	if coordinates.x < grid_rows - 1:
		new_coords.append(control_list[coordinates.x + 1][coordinates.y])
	
	if coordinates.y > 0:
		new_coords.append(control_list[coordinates.x][coordinates.y - 1])
	
	if coordinates.y < grid_columns - 1:
		new_coords.append(control_list[coordinates.x][coordinates.y + 1])
		
	return new_coords

func grid_update(onDayChanged : bool):
	
	#go through all rows and columns via control list
	for i in range(len(control_list)):
		for j in range(len(control_list[0])):
			
			#get grid slot
			var grid_slot =  slot_list[i][j]
			
			#check if there is a vegetable as a child to the grid slot
			var slot_child = grid_slot.get_child(0).get_children()
			if slot_child != []:
				control_list[i][j] = [slot_child[0]]
			else :
				control_list[i][j] = []
	
	#change effects for all the plants in the garden and total effect
	for i in range(len(control_list)):
		for j in range(len(control_list[0])):
			
			var garden_vegetable = control_list[i][j]
			
			#check if current slot isn't empty
			if garden_vegetable != [] :
				if garden_vegetable[0].isGrown():
					#garden_vegetable[0].grown_state()
					garden_vegetable[0].effect(get_adjacent_tiles(Vector2(i,j)),onDayChanged)
	
	var total_stat : Dictionary = {
	"EARTHQUAKE" : 0,
	"FIRE" : 0,
	"TORNADO" : 0,
	"TSUNAMI" : 0
}
	for i in range(len(control_list)):
		for j in range(len(control_list[0])):
			
			var garden_vegetable = control_list[i][j]
			
			#check if current slot isn't empty
			if garden_vegetable != [] :
				#check if the day update is on a day change
				if onDayChanged ==  true:
					#les plantes pousses
					garden_vegetable[0].current_growState += 1
					
				if garden_vegetable[0].isGrown():
					for element in total_stat:
						total_stat[element] += garden_vegetable[0].new_stat_catastrophe[element]
	
	GlobalInfo.global_stats = total_stat
	
	#search for stats display
	var stat_display_node = get_parent().get_parent().get_node("StatDisplay").get_node("HBoxContainer")
	var global_stats = GlobalInfo.global_stats
	
	var earthquake_label = stat_display_node.get_node("EarthquakeValue")
	var fire_label = stat_display_node.get_node("FireValue")
	var tornado_label = stat_display_node.get_node("TornadoValue")
	var tsunami_label = stat_display_node.get_node("TsunamiValue")
	
	earthquake_label.text = str(global_stats["EARTHQUAKE"])
	fire_label.text = str(global_stats["FIRE"])
	tornado_label.text = str(global_stats["TORNADO"])
	tsunami_label.text = str(global_stats["TSUNAMI"])	

func _ready():
	generate_grid(grid_rows, grid_columns) 
	GlobalInfo.changeDay.connect(grid_update.bind(true))
	GlobalInfo.planted.connect(grid_update.bind(false))

#func changeDay():
	#grid_update(true)
	#pass

