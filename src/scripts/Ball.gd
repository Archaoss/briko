extends KinematicBody2D

export var speed := 300
export var mass := 10
export var bounce_randomness := 2.0 # deg

var direction : Vector2
var launchable = true
onready var initial_pos := position
onready var anim_player : AnimationPlayer = $AnimationPlayer


func _process(_delta: float) -> void:
	if direction == Vector2.ZERO and Input.is_action_just_pressed("ball_throw"):
		launch()


func _physics_process(delta: float) -> void:
	var vel := direction * speed * delta
	var collision = move_and_collide(vel, false)
	
	if collision:
		if collision.collider.is_in_group("bricks"):
			var hit_brick = collision.collider as Brick
			hit_brick.take_hit(position, mass * vel)
			Audio.play_sound(self, Audio.Sound.BRICK)
		else:
			Audio.play_sound(self, Audio.Sound.PADDLE)
			
		direction = direction.bounce(collision.normal)
		var phi := atan2(direction.y, direction.x)
		phi += deg2rad(rand_range(-bounce_randomness, bounce_randomness))
		direction = Vector2(cos(phi), sin(phi))


func _on_fall() -> void:
	Audio.play_sound(self, Audio.Sound.DEATH)
	anim_player.play("die")
	var _e = get_tree().create_timer(0.1).connect("timeout", self, "stop")


func stop() -> void:
	direction = Vector2.ZERO
	

func reinit() -> void:
	position = initial_pos
	launchable = true


func launch() -> void:
	if launchable:
		var phi := rand_range(PI / 4, PI * 3 / 4)
		direction = Vector2(cos(phi), -sin(phi))
		launchable = false

