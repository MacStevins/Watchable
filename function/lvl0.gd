extends "res://function/main.gd"

func new_game():
	$entities/player.start($playerStart.position)

func _ready():
	new_game()
