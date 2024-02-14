extends TextureRect
class_name  Vegetable

@export var vegetable_name : String
@export var type : String

@export var price: int 

@export var stat_catastrophe : Array = [0,0,0,0] #0 = tramblement de terre; 1 = incendi; 2 = tornade ; 3 = tsunami
@export var effect_description : String = "je donne 1 point de ..."

@export var growing_time : int
var current_growState : int

var grid_position : Vector2

#drag and drop function
func _on_gui_input(event):
	pass # Replace with function body.
