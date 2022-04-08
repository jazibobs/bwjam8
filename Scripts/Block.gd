"""
Partically inspired by ericdl's code on the Godot engine qa forum:
https://godotengine.org/qa/6615/dragging-object-in-godot-rigidbody2d-dragging
"""

extends RigidBody2D

const RIGIDBODY_SPEED = 1000

var is_active = false
var set_rotation = rotation
var is_dragging = false
var pointer_is_over = false
var user_press = false
var input_pos = Vector2(0,0)
var input_distance
var rigidbody_vector = 0


func _ready():
	set_process_input(true)
	set_physics_process(true) 


func _physics_process(delta):
	if pointer_is_over:
		mode = RigidBody2D.MODE_RIGID
		input_pos = self.get_global_mouse_position()
		input_distance = self.position.distance_to(input_pos)
		is_dragging = true
		rotation = set_rotation
		
		if (input_distance <= 5.0):
			rigidbody_vector = 0
			self.set_linear_velocity(Vector2())
		else:
			rigidbody_vector = (input_pos - self.position).normalized()
			self.set_linear_velocity(rigidbody_vector * RIGIDBODY_SPEED * input_distance * delta)
	else:
		mode = RigidBody2D.MODE_STATIC
		rotation = set_rotation

func set_inactive():
	is_active = false
	$Sprite.modulate = Color(0.4, 0.4, 0.4)


func set_active():
	is_active = true
	$Sprite.modulate = Color(1, 1, 1)


func _on_Block_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("ui_touch"):
		pointer_is_over = true
	elif Input.is_action_just_released("ui_touch"):
		pointer_is_over = false
