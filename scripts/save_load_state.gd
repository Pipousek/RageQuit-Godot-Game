extends Node

var save_filename = "user://ragequit_game_state.save"

var _completed_level
var _background_music_level
var _effects_music_level

func get_completed_level():
	return _completed_level

func set_completed_level(level_number: int):
	if level_number > _completed_level:
		_completed_level = level_number
		_save_game()

func get_background_music_level():
	return _background_music_level

func set_background_music_level(music_level):
	_background_music_level = music_level
	_save_game()

func get_effects_music_level():
	return _effects_music_level

func set_effects_music_level(effects_level):
	_effects_music_level = effects_level
	_save_game()

func _save_game():
	var save_file = FileAccess.open(save_filename, FileAccess.WRITE)
	save_file.store_var(_completed_level)
	save_file.store_var(_background_music_level)
	save_file.store_var(_effects_music_level)

func load_game():
	if FileAccess.file_exists(save_filename):
		var save_file = FileAccess.open(save_filename, FileAccess.READ)
		_completed_level = save_file.get_var()
		_background_music_level = save_file.get_var()
		_effects_music_level = save_file.get_var()
	else:
		print("No data saved!")
		_completed_level = 0
		_background_music_level = 30
		_effects_music_level = 30
	
	print("Last Completed Level: ", _completed_level)
	print("Last Background Music Level: ", _background_music_level)
	print("Last Effects Music Level: ", _effects_music_level)
	print()
