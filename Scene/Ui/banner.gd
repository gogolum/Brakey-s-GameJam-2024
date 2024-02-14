extends Control
#texture
@onready var texture_rect = $MarginContainer/TextureRect
#price
@onready var buy_value = $HBoxContainer/BuyValue
@onready var sell_value = $HBoxContainer/SellValue

@onready var growing_time_valeur = $growingTimeValeur

@onready var description_effect = $VBoxContainer/DescriptionEffect

@onready var earthquake_value = $desasterStatHolder/HBoxContainer/earthquakeValue
@onready var firevalue = $desasterStatHolder/HBoxContainer/Firevalue
@onready var tornado_value = $desasterStatHolder/HBoxContainer2/TornadoValue
@onready var tsunami_value = $desasterStatHolder/HBoxContainer2/TsunamiValue



func setBanner(vegetable : Vegetable):
	texture_rect.texture = vegetable.vegetable_texture.texture
	buy_value.text = str(vegetable.price)
	sell_value.text = str(vegetable.sell_price)
	growing_time_valeur.text = str(vegetable.growing_time)
	description_effect.text = str(vegetable.effect_description)
	#stat
	earthquake_value.text = str(vegetable.stat_catastrophe[0])
	firevalue.text = str(vegetable.stat_catastrophe[1])
	tornado_value.text = str(vegetable.stat_catastrophe[2])
	tsunami_value.text = str(vegetable.stat_catastrophe[3])
	
