extends Control

var _is_showed = false

func _ready():
	self._hide_me()

func _on_exit_button_pressed():
	_is_showed = false
	self._hide_me()

func _on_music_slider_value_changed(value):
	SaveLoadState.set_background_music_level(value)
	AudioPlayer.set_music_volume(value)
	if 33 > value and value > 0:
		$SettingsPanel/ColorRect/AudioSpeaker.frame = 2
	elif 66 > value and value >= 33:
		$SettingsPanel/ColorRect/AudioSpeaker.frame = 1
	elif value >= 66:
		$SettingsPanel/ColorRect/AudioSpeaker.frame = 0
	else:
		$SettingsPanel/ColorRect/AudioSpeaker.frame = 3

func _on_effects_slider_value_changed(value):
	SaveLoadState.set_effects_music_level(value)
	if 33 > value and value > 0:
		$SettingsPanel/EffectRect/EffectSpeaker.frame = 2
	elif 66 > value and value >= 33:
		$SettingsPanel/EffectRect/EffectSpeaker.frame = 1
	elif value >= 66:
		$SettingsPanel/EffectRect/EffectSpeaker.frame = 0
	else:
		$SettingsPanel/EffectRect/EffectSpeaker.frame = 3

func show_me():
	Engine.time_scale = 0
	SaveLoadState.load_game()
	
	$SettingsPanel/EffectsSlider.value = SaveLoadState.get_effects_music_level()
	$SettingsPanel/MusicSlider.value = SaveLoadState.get_background_music_level()
	AudioPlayer.play_music_level()
	AudioPlayer.set_music_volume($SettingsPanel/MusicSlider.value)
	
	_is_showed = true
	self.show()
	self.move_to_front()

func _hide_me():
	Engine.time_scale = 1	
	SaveLoadState.load_game()
	
	$SettingsPanel/MusicSlider.value = SaveLoadState.get_background_music_level()
	AudioPlayer.play_music_level()
	AudioPlayer.set_music_volume($SettingsPanel/MusicSlider.value)
	
	_is_showed = false
	self.hide()

func get_is_showed():
	return _is_showed
