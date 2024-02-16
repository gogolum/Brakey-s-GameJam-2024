extends TextureRect
class_name  Vegetable

@onready var vegetable_texture = $VegetableTexture
@onready var sprout_texture = $SproutTexture
@onready var growth_progress_bar = $GrowthProgressBar


@export var vegetable_name : String

@export var type : String
@export var price: int 
@export var sell_price: int 

@export var stat_catastrophe : Dictionary = {
	"EARTHQUAKE" : 0,
	"FIRE" : 0,
	"TORNADO" : 0,
	"TSUNAMI" : 0
}
var new_stat_catastrophe : Dictionary = stat_catastrophe

@export var effect_description : String = "je donne 1 point de ..."

@export var growing_time : int
var current_growState : int

var grid_position : Vector2

#drag variables
signal mouse_released
signal picked_up_changed(picked)

@onready var drag_button = $DragButton


func _ready():
	current_growState = 0
	growth_progress_bar.max_value = growing_time
	initialise()
	new_stat_catastrophe = stat_catastrophe

func initialise():
	pass

var isover_empty_plot : bool
func effect(adjacent : Array, onDayChanged : bool):
	pass

#function a call dans le ready de toutes les plantes et qui les initialises

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
		z_index = 2
	else :
		z_index = 1
	
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
			var vegetable_parent = get_parent()
			var sold_icon_parent = vegetable_parent.get_parent().get_parent().get_node("SoldIcon")
			sold_icon_parent.show()
			get_parent().remove_child(vegetable)
			GlobalInfo.hoovered_plot.get_node('SlotSnappingPoint').add_child(vegetable)
			vegetable.global_position = get_parent().get_parent().get_node('SlotSnappingPoint').global_position
			
			isbought = true
			GlobalInfo.coin -= vegetable.price
			var bought_icon = 0
			grown_state()
			

			$Particule/PlantedParticule.global_position = global_position + Vector2(50,50)
			$Particule/PlantedParticule.emitting = true

			#envoie l'info au jardin qu'un légume a été planté and play the right sound
			GlobalInfo.play_sound("res://Assets/sound_effects/plant_sound.mp3", -10)
	  
			GlobalInfo.planted.emit()
			$DragTimer.start()
			
	if isbought and $DragTimer.is_stopped() and current_growState >= growing_time:
		var vegetable = self
		picked_up = true
		GlobalInfo.play_sound("res://Assets/sound_effects/unroot_sound.mp3", -10)
		await mouse_released
		picked_up = false
		vegetable.global_position = get_parent().global_position
		
		if GlobalInfo.canSell == true:
			GlobalInfo.play_sound("res://Assets/sound_effects/sell_sound.mp3", 0)
			vegetable.queue_free()
			GlobalInfo.coin += sell_price
		pass
func destroy():
	queue_free()

func grown_state():
	if isbought :
		if current_growState < growing_time:
			sprout_texture.show()
			vegetable_texture.visible = false
			growth_progress_bar.show()
			growth_progress_bar.value = current_growState
			growth_progress_bar.max_value = growing_time
			growth_progress_bar.get_child(1).texture = vegetable_texture.texture
		else :
			growth_progress_bar.hide()
			vegetable_texture.show()
			sprout_texture.hide()
	else :
		growth_progress_bar.hide()
		vegetable_texture.show()
		sprout_texture.hide()

func isGrown():
	return current_growState >= growing_time
