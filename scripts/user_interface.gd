extends Control

func _ready():
	SaveLoadState.load_game()
	
	$Settings/SettingsPanel/MusicSlider.value = SaveLoadState.get_background_music_level()
	AudioPlayer.play_music_level()
	AudioPlayer.set_music_volume($Settings/SettingsPanel/MusicSlider.value)
	
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

func _on_level_6_pressed():
	get_tree().change_scene_to_file("res://scenes/level_6.tscn")

func _on_level_7_pressed():
	get_tree().change_scene_to_file("res://scenes/level_7.tscn")

func _on_level_8_pressed():
	get_tree().change_scene_to_file("res://scenes/level_8.tscn")

func _on_level_9_pressed():
	get_tree().change_scene_to_file("res://scenes/level_9.tscn")

func _on_level_10_pressed():
	get_tree().change_scene_to_file("res://scenes/level_10.tscn")

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

func _on_settings_pressed():
	$Settings.show_me()
