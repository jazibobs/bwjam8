extends RigidBody2D


func _ready():
	# Set up physics
	set_physics_process(true) 
	
	# Randomise position
	# randomize()
	# var starting_x = rand_range(-200, 200) + 960
	# self.position.x = starting_x


func _on_PhysicsBody_body_entered(body):
	$AudioStreamPlayer2D.play()
	body.get_node("Sprite").modulate = Color(1,1,1)
