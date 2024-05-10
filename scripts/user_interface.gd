extends Control

func _ready():
	SaveLoadState.load_game()	
	
	$AudioVolume.value = SaveLoadState.get_background_music_level()
	AudioPlayer.play_music_level()
	AudioPlayer.set_music_volume($AudioVolume.value)
	
	var _levels = _get_list_buttons()
	var _complete_levels = SaveLoadState.get_completed_level()
	for idx in range(_complete_levels + 1, len(_levels)):
		_levels[idx].disabled = true
	
	AudioPlayer.set_level_started(false)

func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")

func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://scenes/level_2.tscn")

func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://scenes/level_3.tscn")

func _on_level_4_pressed():
	get_tree().change_scene_to_file("res://scenes/level_4.tscn")

func _on_level_5_pressed():
	get_tree().change_scene_to_file("res://scenes/level_5.tscn")

func _on_audio_volume_value_changed(value):
	SaveLoadState.set_background_music_level(value)
	AudioPlayer.set_music_volume(value)
	if 33 > value and value > 0:
		$ColorRect/AudioSpeaker.frame = 2
	elif 66 > value and value >= 33:
		$ColorRect/AudioSpeaker.frame = 1
	elif value >= 66:
		$ColorRect/AudioSpeaker.frame = 0
	else:
		$ColorRect/AudioSpeaker.frame = 3

func _get_list_buttons():
	return [
		$Level_1,
		$Level_2,
		$Level_3,
		$Level_4,
		$Level_5,
		$Level_6,
		$Level_7,
		$Level_8,
		$Level_9,
		$Level_10
	]
