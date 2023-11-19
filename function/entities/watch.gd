extends "res://function/templates/itemInherit.gd"

var lvl0

func try_pickup(body):
	if body.get_name() == "player" && !hasPickup:
		var entities = get_parent()
		entities.get_node("player").disabled = true;
		
		lvl0 = entities.get_parent()
		var animPlayer = lvl0.get_node("animPlayer")
		animPlayer.connect("animation_finished", self, "fadeInAnimFinished")
		animPlayer.play("fadeSecret")
		
		hide()
		hasPickup = true

func fadeInAnimFinished(_animName):
	if hasPickup:
		lvl0.get_node("secretWall").set_collision_mask_bit(0, false)
