extends Node

class_name BrickGenerator

signal brick_destroyed
signal bricks_cleared

export var gridSize := Vector2(10, 10)

var bricks_left: int

onready var brick = load("res://Brick.tscn")

func _ready() -> void:
	var _e
	bricks_left = 0
	for i in range(-gridSize.x / 2, gridSize.x / 2):
		for j in range(-gridSize.y / 2, gridSize.y / 2):
			var b: Brick = brick.instance()
			_e = b.connect("destroyed", self, "_on_brick_destroyed")
			b.modulate.h = randf()
			b.position = Vector2(80 * i + 40, 35 * j)
			add_child(b)
			bricks_left += 1


func _on_brick_destroyed() -> void:
	emit_signal("brick_destroyed")
	bricks_left -= 1
	
	if bricks_left == 0:
		var _e = get_tree().create_timer(2).connect("timeout", self, "reset")
		emit_signal("bricks_cleared")

func reset() -> void:
	for c in get_children():
		c.queue_free()
	
	_ready()
