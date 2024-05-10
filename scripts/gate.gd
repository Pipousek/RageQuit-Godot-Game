extends Area2D

const level_win = preload("res://resources/level_win.wav")

func _ready():
	$Player.hide()

func _on_body_entered(body):
	var scene_path = get_tree().current_scene.scene_file_path
	var scene_level = scene_path.replace("res://scenes/level_", "").replace(".tscn", "")
	SaveLoadState.set_completed_level(int(scene_level))
	
	AudioPlayer.play_sound_effect(level_win, 0)
	
	body.queue_free()
	$Player.show()
	$AnimationPlayer.play("gate_animation")

func _on_animation_player_animation_finished(_anim_name):
	$AnimationPlayer.play("RESET")
	get_tree().change_scene_to_file("res://scenes/control.tscn")
