extends "res://function/templates/itemInherit.gd"

signal pickup_hand

func try_pickup(body):
	if body.get_name() == "player" && !hasPickup:
		var name = get_name()
		
		if name == "secondHand" && !global.handsCollected[0]:
			global.handsCollected[0] = true
		elif name == "minuteHand" && !global.handsCollected[1]:
			global.handsCollected[1] = true
		elif name == "hourHand" && !global.handsCollected[2]:
			global.handsCollected[2] = true
		else:
			return
		
		emit_signal("pickup_hand")
		
		hide()
		hasPickup = true
