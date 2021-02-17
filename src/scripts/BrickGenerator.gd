extends Node

export var gridSize := Vector2(10, 10)

onready var brick = load("res://Brick.tscn")

func _ready():
	for i in range(-gridSize.x / 2, gridSize.x / 2):
		for j in range(-gridSize.y / 2, gridSize.y / 2):
			var b = brick.instance()
			b.connect("destroyed", get_node("/root/MainScene"), "_on_brick_destroyed")
			b.position = Vector2(80 * i + 40, 35 * j)
			add_child(b)

