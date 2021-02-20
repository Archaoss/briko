extends Node

enum Type {
	NON_POSITIONAL,
	POSITIONAL_2D,
}


enum Sound {
	BRICK,
	PADDLE,
	DEATH,
	CLEARED,
}


var streams : Array


func _ready():
	streams.append(preload("res://audio/cloc1.wav"))
	streams.append(preload("res://audio/cloc2.wav"))
	streams.append(preload("res://audio/die.wav"))
	streams.append(preload("res://audio/cleared.wav"))

func play_sound(parent: Node, sound_type: int) -> void:
	var pitch = 1.0 + (randf() - 0.5) / 2.0	
	play(Type.POSITIONAL_2D if parent != null else Type.NON_POSITIONAL,
		parent if parent != null else self,
		streams[sound_type], 0.0, pitch)


# Plays a sound. The AudioStreamPlayer node will be added to the `parent`
# specified as parameter.
func play(type: int, parent: Node, stream: AudioStream, volume_db: float = 0.0, pitch_scale: float = 1.0) -> void:
	var audio_stream_player: Node
	match type:
		Type.NON_POSITIONAL:
			audio_stream_player = AudioStreamPlayer.new()
		Type.POSITIONAL_2D:
			audio_stream_player = AudioStreamPlayer2D.new()

	parent.add_child(audio_stream_player)
	audio_stream_player.bus = "Effects"
	audio_stream_player.stream = stream
	audio_stream_player.volume_db = volume_db
	audio_stream_player.pitch_scale = pitch_scale
	audio_stream_player.play()
	var _e = audio_stream_player.connect("finished", audio_stream_player, "queue_free")
