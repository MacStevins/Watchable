extends Area2D

export var frequency = 5
export var amplitude = .5

var hasPickup = false
var object_size
var screen_size
var time = 0

var randomDirection = ( 1 if bool(randi() % 2) else -1)

func _ready():
	hide()
	object_size = ($collision.shape.get_extents() * 2 * get_scale())
	screen_size = get_viewport_rect().size - object_size
	
	connect("body_entered", self, "try_pickup")

func start(pos):
	position = pos
	show()
	$collision.disabled = false

func _process(delta):
	time += delta * frequency
	
	position += Vector2(0, sin(time) * amplitude * randomDirection)
