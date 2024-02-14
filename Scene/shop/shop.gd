extends Control


func _ready():
	regenerate_shop()

func regenerate_shop():
	
	#variable to hold all of the shop slots
	var shop_slots = []
	for element in $ShopList.get_children():
		shop_slots.append(element.get_node("Marker2D").get_child(0))
	
	#get the global dictionnary with all vegetables set a list with all the names
	var vegetable_dict = GlobalInfo.vegetables
	var vegetable_names : Array
	for element in vegetable_dict:
		vegetable_names.append(element)
	
	#sets a list with all the futur elements
	var new_shop = []
	
	for _i in range(len(shop_slots)):
		
		#generates a random integer in the range of the number of vegetables name
		var vegetable_int = randi_range(0, len(vegetable_names) - 1)
		
		#add vegetable to the new shop list
		new_shop.append(vegetable_dict[vegetable_names[vegetable_int]].instantiate())
	
	for element in $ShopList.get_children():
		if element.get_node("Marker2D").get_child(0).get_children() != []:
			element.get_node("Marker2D").get_child(0).get_child(0).free()
	
	#remove old child and add new one from new shop
	for i in range(len(shop_slots)):		
		shop_slots[i].add_child(new_shop[i])
		new_shop[i].global_position = shop_slots[i].get_parent().global_position

	set_price()

func set_price():
	for element in $ShopList.get_children():
		var vegetable_sold = element.get_node("Marker2D").get_child(0).get_child(0)
		var price_label = element.get_node("PriceLabel")
		price_label.text = str(vegetable_sold.price) + "$"
