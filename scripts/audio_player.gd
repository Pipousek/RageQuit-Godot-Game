extends AudioStreamPlayer

const level_music = preload("res://resources/Elevator-Music---Kevin-MacLeod.wav")
var _level_started = false

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
		
	stream = music
	volume_db = volume
	play()

func play_music_level():
	_play_music(level_music)

func set_music_volume(value):
	volume_db = lerp(-60, 10, value/100.0)

func play_sound_effect(effect_stream: AudioStream, effect_volume_db = 0.0):
	var effect_volume = SaveLoadState.get_effects_music_level()
	effect_volume_db = lerp(-60, 10, effect_volume/100.0)
	var effect_player = AudioStreamPlayer.new()
	effect_player.stream = effect_stream
	effect_player.name = stream.resource_path
	effect_player.volume_db = effect_volume_db
	add_child(effect_player)
	effect_player.play()
	
	await effect_player.finished
	effect_player.queue_free()

func get_level_started():
	return _level_started

func set_level_started(value: bool):
	_level_started = value

func _on_finished():
	play()
