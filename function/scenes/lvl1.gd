extends "res://function/templates/lvlInherit.gd"

func new_game():
	$entities/player.start(Vector2(global.playerPos.x, $entities/playerStart.position.y))
	$entities/secondHand.start($entities/secondHandStart.position)
	$entities/minuteHand.start($entities/minuteHandStart.position)
	$entities/hourHand.start($entities/hourHandStart.position)

func _ready():
	if !$animPlayer.is_connected("animation_finished", self, "fadeInAnimFinished"):
		$animPlayer.connect("animation_finished", self, "fadeInAnimFinished")
		$animPlayer.play_backwards("fade")
		new_game()

func _process(_delta):
	pass
