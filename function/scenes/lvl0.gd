extends "res://function/templates/lvlInherit.gd"

func new_game():
	$entities/player.start(Vector2($entities/playerStart.position.x, global.playerPos.y))
	$entities/watch.start($entities/watchStart.position)

func _ready():
	if !$animPlayer.is_connected("animation_finished", self, "fadeInAnimFinished"):
		$secretWall.set_collision_mask_bit(0, true)
		$animPlayer.connect("animation_finished", self, "fadeInAnimFinished")
		$animPlayer.play_backwards("fade")
		new_game()

func _process(_delta):
	if $entities/watch.hasPickup:
		try_transition("lvl1");
