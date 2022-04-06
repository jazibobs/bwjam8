extends Node2D

var ball_scene = preload("res://Objects/Ball.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	$BallSpawn.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BallSpawn_timeout():
	var new_ball = ball_scene.instance()
	$AllBalls.add_child(new_ball)
