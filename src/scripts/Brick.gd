extends RigidBody2D

class_name Brick

signal destroyed

onready var anim_player : AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	add_to_group("bricks")

	
func take_hit(contact: Vector2, momentum: Vector2) -> void:
	emit_signal("destroyed")
	
	collision_layer = 2
	collision_mask = 2
	gravity_scale = 10
	z_index = -10
	
	linear_velocity = momentum / mass
	
	apply_torque_impulse((contact - global_position).cross(momentum))
	anim_player.get_animation("die").track_set_key_value(0, 0, modulate)
	anim_player.play("die")
