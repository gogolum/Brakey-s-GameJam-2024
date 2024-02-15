extends TextureRect
class_name  Vegetable

@onready var vegetable_texture = $VegetableTexture
@onready var sprout_texture = $SproutTexture

@export var vegetable_name : String

@export var type : String
@export var price: int 
@export var sell_price: int 

@export var stat_catastrophe : Array = [0,0,0,0] #0 = tramblement de terre; 1 = incendi; 2 = tornade ; 3 = tsunami
var new_stat_catastrophe : Array = stat_catastrophe

@export var effect_description : String = "je donne 1 point de ..."

@export var growing_time : int
var current_growState : int

var grid_position : Vector2

#drag variables
signal mouse_released
signal picked_up_changed(picked)

@onready var drag_button = $DragButton



var isover_empty_plot : bool
func effect(adjacent : Array):
	pass

var picked_up : bool = false :
	set(b):
		if not b:
			global_position = get_parent().get_parent().global_position
		picked_up = b
		picked_up_changed.emit()

#check if item is bought
var isbought : bool = false

func _process(_delta):
	if picked_up:
		global_position = get_global_mouse_position()
	
	if Input.is_action_just_released("LeftClick"):
		mouse_released.emit()
		
	if drag_button.is_hovered():
		GlobalInfo.hoovered_vegetable = self
	grown_state()

func _on_drag_button_pressed():
	if !isbought:
		picked_up = true
		await mouse_released
		picked_up = false
		
		if GlobalInfo.hoovered_plot and GlobalInfo.hoovered_plot.get_node('SlotSnappingPoint').get_children() == []:
			var vegetable = self
			get_parent().remove_child(vegetable)
			GlobalInfo.hoovered_plot.get_node('SlotSnappingPoint').add_child(vegetable)
			vegetable.global_position = get_parent().get_parent().get_node('SlotSnappingPoint').global_position
			isbought = true
			grown_state()
			GlobalInfo.coin -= vegetable.price
			GlobalInfo.planted.emit()
func destroy():
	queue_free()

func grown_state():
	if isbought :
		if current_growState < growing_time:
			sprout_texture.show()
			vegetable_texture.visible = false
		else :
			vegetable_texture.show()
			sprout_texture.hide()
	else :
		vegetable_texture.show()
		sprout_texture.hide()


