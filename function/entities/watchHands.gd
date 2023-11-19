extends "res://function/templates/itemInherit.gd"

func try_pickup(body):
	if body.get_name() == "player" && !hasPickup:
		var name = get_name()
		
		if name == "secondHand" && !global.handsCollected[0]:
			global.handsCollected[0] = true
		if name == "minuteHand" && !global.handsCollected[1]:
			global.handsCollected[1] = true
		if name == "hourHand" && !global.handsCollected[2]:
			global.handsCollected[2] = true
		
		hide()
		hasPickup = true
