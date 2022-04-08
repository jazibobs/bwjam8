extends Node2D

var ball_scene = preload("res://Objects/Ball.tscn")
export (String) var debug_data = ""

func _ready():
	set_physics_process(true)
	# $BallSpawn.start()
	var new_ball = ball_scene.instance()
	$AllBalls.add_child(new_ball)

func _process(_delta):
	
	
	debug_data = {
		#"is_active" : $AllBlocks.get_child(0).is_active,
		# "is_dragging" : $AllBlocks.get_child(0).is_dragging,
		"pointer_is_over" : $AllBlocks.get_child(0).pointer_is_over,
		"input_pos" : $AllBlocks.get_child(0).input_pos,
		"input_distance" : $AllBlocks.get_child(0).position.distance_to($AllBlocks.get_child(0).input_pos)
	}
	
	for ball in $AllBalls.get_children():
		if ball.position.y > 1500:
			ball.queue_free()
			spawn_new_ball()
			reset_all_blocks()


func reset_all_blocks():
	for block in $AllBlocks.get_children():
		block.set_inactive()


func spawn_new_ball():
	var new_ball = ball_scene.instance()
	$AllBalls.add_child(new_ball)


func _on_BallSpawn_timeout():
	# var new_ball = ball_scene.instance()
	# $AllBalls.add_child(new_ball)
	pass
