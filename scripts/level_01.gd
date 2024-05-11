extends Node2D

var shifts = []

func _ready():
	print(Settings.get_is_showed())
	Settings.show_me()
	print(Settings.get_is_showed())
	
	AudioPlayer.play_music_level()
	
	for i in range(3):
		shifts.append(false)

func _on_detect_area_body_entered(_body):
	if shifts[0] == false:
		$"platform-parent2/Platform/AnimationPlayer".play("Global/shift-right")
		shifts[0] = true

func _on_detect_area_2_body_entered(_body):
	if shifts[1] == false:
		$"platform-parent4/Platform/AnimationPlayer".play("Global/shift-left")
		shifts[1] = true

func _on_detect_area_3_body_entered(_body):
	if shifts[2] == false:
		$"platform-parent6/Platform/AnimationPlayer".play("Global/shift-left")
		shifts[2] = true
		print("start-world1")
		await get_tree().create_timer(5.0).timeout
		print("end-world1")
		$"platform-parent7/Platform/AnimationPlayer".play("Global/shift-right")
