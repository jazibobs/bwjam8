extends RigidBody2D


var temp_linear_vel = Vector2()

func _ready():
	# Set up physics
	set_physics_process(true) 
	$CollisionShape2D.disabled = false
	$Sprite.modulate = Color(1,1,1)
	
	# Randomise position
	# randomize()
	# var starting_x = rand_range(-200, 200) + 960
	# self.position.x = starting_x


func _on_PhysicsBody_body_entered(body):
	$AudioStreamPlayer2D.play()
	
	# get_node("/root/Game/PlayerCamera").start_shake()
	
	if body.collision_layer == 2:
		body.toggle_active()


func _input(event):
	if Input.is_action_just_pressed("ui_touch"):
		temp_linear_vel = linear_velocity
		$CollisionShape2D.disabled = true
		$Sprite.modulate = Color(0.4,0.4,0.4)
		mode = RigidBody2D.MODE_STATIC
	
	if Input.is_action_just_released("ui_touch"):
		mode = RigidBody2D.MODE_RIGID
		linear_velocity = temp_linear_vel
		$Cooldown.start()


func _on_Cooldown_timeout():
	$CollisionShape2D.disabled = false
	$Sprite.modulate = Color(1,1,1)
