extends Control
@onready var banner = $CanvasLayer2/Banner

func _process(delta):
	print(GlobalInfo.hoovered_vegetable)
	if GlobalInfo.hoovered_vegetable != null:
		banner.setBanner(GlobalInfo.hoovered_vegetable)
