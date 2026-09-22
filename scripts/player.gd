extends Area2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
func _ready():
	screen_size = get_viewport_rect().size # is called when a node enters the scene tree, which is a good time to find the size of the game window:
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	position += velocity * delta
	var sprite_half_size = $AnimatedSprite2D.sprite_frames.get_frame_texture("up", 0).get_size() * $AnimatedSprite2D.scale / 2
	position = position.clamp(sprite_half_size, screen_size - sprite_half_size)
