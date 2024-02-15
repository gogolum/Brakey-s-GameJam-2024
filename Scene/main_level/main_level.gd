extends Control
@onready var banner = $CanvasLayer2/Banner
@onready var shop = $CanvasLayer2/Shop

func _process(delta):
	if GlobalInfo.hoovered_vegetable != null:
		banner.setBanner(GlobalInfo.hoovered_vegetable)


func _on_button_pressed():
	GlobalInfo.dayCount += 1
	shop.regenerate_shop()
	pass # Replace with function body.
