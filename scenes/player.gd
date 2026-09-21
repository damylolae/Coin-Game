extends Area2D

@export var speed = 500 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
func _ready():
	screen_size = get_viewport_rect().size # is called when a node enters the scene tree, which is a good time to find the size of the game window:
