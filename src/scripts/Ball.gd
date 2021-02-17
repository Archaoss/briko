extends KinematicBody2D

export var speed := 300
export var mass := 10
export var bounce_randomness := 2 # deg

var direction: Vector2
onready var initial_pos := position


func _ready():
	rethrow()


func _draw():
	draw_circle(Vector2(), 10, Color.white)
	draw_circle(Vector2(-2, 2), 9, Color.gray)


func _physics_process(delta: float):
	var vel := direction * speed * delta
	var collision = move_and_collide(vel, false)
	
	if collision:
		if collision.collider.is_in_group("bricks"):
			var hit_brick = collision.collider as Brick
			hit_brick.take_hit(position, mass * vel)
			
		direction = direction.bounce(collision.normal)
		var phi := atan2(direction.y, direction.x)
		phi += deg2rad(rand_range(-bounce_randomness, bounce_randomness))
		direction = Vector2(cos(phi), sin(phi))


func _on_fall():
	$Tween.interpolate_property(self, "modulate", modulate, Color(0, 0, 0, 0), 1)
	yield(get_tree().create_timer(1), "timeout")
	rethrow()


func rethrow():
	position = initial_pos
	var phi := rand_range(PI / 4, PI * 3 / 4)
	direction = Vector2(cos(phi), -sin(phi))

