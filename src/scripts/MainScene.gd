extends Node2D

var score := 0

onready var score_label : Label = $GUI/ScoreLabel
onready var score_format := score_label.text


func _init() -> void:
	randomize()


func _ready() -> void:
	var _e
	_e = $Walls/Floor.connect("ball_fall", $Ball, "_on_fall")
	_e = $Walls/Floor.connect("ball_fall", self, "_on_ball_fall")
	_e = $BrickGenerator.connect("brick_destroyed", self, "_on_brick_destroyed")
	_e = $BrickGenerator.connect("bricks_cleared", self, "_on_bricks_cleared")
	update_score_label()



func _on_ball_fall() -> void:
	score = 0
	update_score_label()


func _on_bricks_cleared() -> void:
	Audio.play_sound(null, Audio.Sound.CLEARED)
	

func _on_brick_destroyed() -> void:
	score += 10
	update_score_label()
	
	
func _unhandled_key_input(event) -> void:
	if event.is_action_pressed("ui_quit"):
		get_tree().quit()
	
	if event.is_action_pressed("ui_reset"):
		_on_ball_fall()
		$BrickGenerator.reset()
		$Ball.reinit()


func update_score_label() -> void:
	score_label.text = score_format % score
