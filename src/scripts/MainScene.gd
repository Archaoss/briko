extends Node2D

var score := 0

onready var score_label: Label = $ScoreLabel
onready var score_format := score_label.text


func _init():
	randomize()


func _ready():
	var _err
	_err = $Walls/Floor.connect("ball_fall", $Ball, "_on_fall")
	_err = $Walls/Floor.connect("ball_fall", self, "_on_ball_fall")
	update_score_label()
	

func _on_brick_destroyed():
	score += 10
	update_score_label()
	
	
func _unhandled_key_input(event):
	if event.is_action_pressed("ui_quit"):
		get_tree().quit()


func _on_ball_fall():
	score = 0
	update_score_label()


func update_score_label():
	score_label.text = score_format % score
