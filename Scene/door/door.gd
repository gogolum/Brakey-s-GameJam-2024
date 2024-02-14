extends Node2D

@onready var main_icon_rect = $UI/MainIconRect
@onready var secondary_icon_rect = $UI/SecondaryIconRect
@onready var sub_icon_rect_2 = $UI/SubIconRect2
@onready var sub_icon_rect = $UI/SubIconRect


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("Idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func generate_order():
	pass
