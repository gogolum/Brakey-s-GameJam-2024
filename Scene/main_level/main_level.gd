extends Control
@onready var banner = $CanvasLayer2/Banner
@onready var shop = $CanvasLayer2/Shop
@onready var day_counter = $"CanvasLayer2/NextDayButton/day counter"

func _ready():
	initialise()

func _process(delta):
	if GlobalInfo.hoovered_vegetable != null:
		banner.setBanner(GlobalInfo.hoovered_vegetable)


func _on_button_pressed():
	GlobalInfo.dayCount += 1
	day_counter.text = str(GlobalInfo.dayCount) + " day"
	shop.regenerate_shop()
	pass # Replace with function body.

func initialise():
	day_counter.text = str(GlobalInfo.dayCount) + " day"
	shop.regenerate_shop()
	
