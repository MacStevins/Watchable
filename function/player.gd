extends CharacterBody2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size - ($mainPlayerCollision.shape.get_rect().size * get_global_scale())

func start(pos):
	position = pos
	show()
	$mainPlayerCollision.disabled = false

func _process(delta):
	var playAnim = "idle"
	
	velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		$playerAnim.flip_h = false;
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		$playerAnim.flip_h = true;
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		playAnim = "run"
	
	move_and_slide()
	
	position = position.clamp(Vector2.ZERO, screen_size)
	$playerAnim.play(playAnim)
