extends CanvasLayer

signal pause_game

func _ready():
	var node = get_parent()
	var entities = node.get_node("entities")
	var secondHand = entities.get_node("secondHand")
	var minuteHand = entities.get_node("minuteHand")
	var hourHand = entities.get_node("hourHand")
	
	secondHand.connect("pickup_hand", self, "_on_pickupHand")
	minuteHand.connect("pickup_hand", self, "_on_pickupHand")
	hourHand.connect("pickup_hand", self, "_on_pickupHand")

func _on_pickupHand():
	var hands = ""
	
	if global.handsCollected[0]:
		hands += "second-"
	if global.handsCollected[1]:
		hands += "minute-"
	if global.handsCollected[2]:
		hands += "hour-"
	
	if global.handsCollected[0] && global.handsCollected[1] && global.handsCollected[2]:
		$watch.texture = load("res://assets/player/items/watch-fixed.png")
	else:
		$watch.texture = load("res://assets/player/items/" + hands + "watch.png")
	
	if $watch.margin_top == -192:
		$animPlayer.play("item_pickup")

func _on_pause_button_up():
	$animPlayer.play_backwards("onPausePress")
	emit_signal("pause_game")

func _on_pause_button_down():
	$animPlayer.play("onPausePress")
