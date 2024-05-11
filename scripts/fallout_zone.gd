extends Area2D

const audio_fallout = preload("res://resources/fallout_enter.wav")

func _on_body_entered(_body):
	AudioPlayer.play_sound_effect(audio_fallout, 0)
	call_deferred("_change_scene")

func _change_scene():
	var scene_path = get_tree().current_scene.scene_file_path
	print(scene_path)
	get_tree().change_scene_to_file(scene_path)
