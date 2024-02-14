extends Control

@onready var texture_rect = $MarginContainer/TextureRect



func setBanner(vegetable : Vegetable):
	texture_rect.texture = vegetable.texture
	

