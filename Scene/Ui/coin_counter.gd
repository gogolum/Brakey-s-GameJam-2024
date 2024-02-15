extends Control

@onready var coin_counter = $"HBoxContainer/Coin counter"

func _ready():
	coin_counter.text = str(GlobalInfo.coin)
	GlobalInfo.udpate_stat.connect(update_coin)

func update_coin():
	coin_counter.text = str(GlobalInfo.coin)
