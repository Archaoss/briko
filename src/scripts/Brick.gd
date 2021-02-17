extends RigidBody2D

class_name Brick

signal destroyed


func _ready():
	add_to_group("bricks")

	
func take_hit(contact: Vector2, momentum: Vector2):
	emit_signal("destroyed")
	
	collision_layer = 2
	collision_mask = 2
	gravity_scale = 10
	z_index = -10
	
	linear_velocity = momentum / mass
	
	apply_torque_impulse((contact - global_position).cross(momentum))
	$Tween.interpolate_property(self, "modulate", modulate, Color(0, 0, 0, 0), 1)
	$Tween.start()
