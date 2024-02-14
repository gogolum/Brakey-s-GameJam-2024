extends Control


func _ready():
	set_price()

func set_price():
	for element in $ShopList.get_children():
		var vegetable_sold = element.get_node("Marker2D").get_child(0).get_child(0)
		var price_label = element.get_node("PriceLabel")
		
		price_label.text = str(vegetable_sold.price) + "$"
