extends KinematicBody2D

export var speed := 500
onready var initial_pos := position

func _process(delta):
	var vel := Vector2()
	
	if Input.is_action_pressed("paddle_left"):
		vel += Vector2(-speed, 0)
		
	if Input.is_action_pressed("paddle_right"):
		vel += Vector2(speed, 0)
	
	var _coll = move_and_collide(vel * delta)
	
	position.y = initial_pos.y
