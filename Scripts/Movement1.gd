extends Node2D

var ball_scene = preload("res://Objects/Ball.tscn")


func _ready():
	set_physics_process(true)
	$BallSpawn.start()


func _process(delta):
	
	for ball in $AllBalls.get_children():
		if ball.position.y > 1500:
			ball.queue_free()


func _on_BallSpawn_timeout():
	var new_ball = ball_scene.instance()
	$AllBalls.add_child(new_ball)
