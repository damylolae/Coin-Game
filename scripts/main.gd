extends Node2D

@export var enemy_scene: PackedScene
var score

func _ready() -> void:
	new_game()


func _on_player_hit() -> void:
	pass # Replace with function body.
func game_over():
	$ScoreTimer.stop()
	$EnemyTimer.stop()
	$HUD.show_game_over()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")


func _on_enemy_timer_timeout():
	# Create a new instance of the Mob scene.
	var mob = enemy_scene.instantiate()

	# Choose a random location on Path2D.
	var mob_spawn_location = $EnemyPath/EnemySpwanLocation
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's position to the random location.
	mob.position = mob_spawn_location.position

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)


func _on_score_timer_timeout():
	score = score + 1 #long for score +=1
	$HUD.update_score(score)


func _on_start_timer_timeout():
	$EnemyTimer.start()
	$ScoreTimer.start()
