extends Area2D


signal ball_fall


func _ready():
	var _err = connect("body_entered", self, "_on_body_entered")


func _on_body_entered(body: PhysicsBody2D):
	if body.name == "Ball":
		emit_signal("ball_fall")
	
	if body.is_in_group("bricks"):
		body.queue_free()
