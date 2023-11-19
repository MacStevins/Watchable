extends KinematicBody2D

export var speed = 400
export var disabled = false
var object_size
var screen_size

func _ready():
	hide()
	object_size = ($collision.shape.get_extents() * 2 * get_scale())
	screen_size = get_viewport_rect().size - object_size

func start(pos):
	position = pos
	show()
	$collision.disabled = false

func _process(_delta):
	var playAnim = "idle"
	
	if disabled:
		$animation.play(playAnim)
		return
	
	var velocity = Vector2.ZERO # The player's movement vector.
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		$animation.flip_h = false;
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		$animation.flip_h = true;
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		playAnim = "run"
	
	move_and_slide(velocity)
	
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	$animation.play(playAnim)
