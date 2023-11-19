extends "res://function/templates/lvlInherit.gd"

func new_game():
	$entities/player.start($entities/playerStart.position)

func _process(_delta):
	try_transition("lvl0");
