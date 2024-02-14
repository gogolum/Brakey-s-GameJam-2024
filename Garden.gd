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
		new_coords.append(control_list[coordinates.x][coordinates.y - 1])
	
	if coordinates.x < grid_rows :
		new_coords.append(control_list[coordinates.x][coordinates.y + 1])
	
	if coordinates.y > 0:
		new_coords.append(control_list[coordinates.x - 1][coordinates.y])
	
	if coordinates.y < grid_columns:
		new_coords.append(control_list[coordinates.x + 1][coordinates.y])
		
	return new_coords
	

func _ready():
	generate_grid(grid_rows, grid_columns)
