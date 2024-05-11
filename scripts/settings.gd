extends Control

var _is_showed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print("VOLE")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_exit_button_pressed():
	_is_showed = false
	self.hide()

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

func show_me():
	SaveLoadState.load_game()	
	
	$SettingsPanel/MusicSlider.value = SaveLoadState.get_background_music_level()
	AudioPlayer.play_music_level()
	AudioPlayer.set_music_volume($SettingsPanel/MusicSlider.value)
	
	_is_showed = true
	self.show()

func get_is_showed():
	return _is_showed
