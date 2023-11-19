extends Node2D

func _init():
	visible = false;

func _ready():
	visible = false;
	$animPlayer.connect("animation_finished", self, "fadeInAnimFinished")
	$animPlayer.play_backwards("fade")
	$hud/pause.connect("pause_game", self, "pauseGame")
	new_game()
	visible = true;

func new_game():
	pass

func _input(_e):
	if Input.is_action_just_pressed("fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen;
		return
	if Input.is_action_pressed("escape"):
		get_tree().quit(0)

func try_transition(lvlName):
	if $triggers.get_cellv($triggers.world_to_map($triggers.to_local($entities/player.global_position + ($entities/player.object_size / 2)))) == 0 && !$animPlayer.is_connected("animation_finished", self, "fadeOutAnimFinished"):
		$entities/player.disabled = true
		$animPlayer.connect("animation_finished", self, "fadeOutAnimFinished", [lvlName])
		$animPlayer.play("fade")

func fadeInAnimFinished(_animName):
	$entities/player.disabled = false

func fadeOutAnimFinished(_animName, lvlName):
	global.playerPos = $entities/player.position
	get_tree().change_scene("res://scenes/main/" + lvlName + ".tscn")

func pauseGame():
	pass
	$animPlayer.stop()
