extends Control
@onready var banner = $CanvasLayer2/Banner

func _process(delta):
	if GlobalInfo.hoovered_vegetable != null:
		banner.setBanner(GlobalInfo.hoovered_vegetable)
