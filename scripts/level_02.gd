extends Node2D

const CustomAnimations = preload("res://scripts/custom_animations.gd")
var shifts = []

func _ready():
	for i in range(3):
		shifts.append(false)

func _on_detect_area_body_entered(_body):
	if shifts[0] == false:
		shifts[0] = true
		var platform = $"platform-parent3"
		var anim_player = $"platform-parent3/Platform/AnimationPlayer"
		CustomAnimations.two_key_frames(platform, anim_player, [0,0], [0,270])
		anim_player.connect("animation_finished", CustomAnimations._on_animation_finished.bind(platform))
		print("start-level-02")
		await get_tree().create_timer(2.0).timeout
		print("end-level-02")
		$"platform-parent5/Platform/AnimationPlayer".play("Global/shift-left")

func _on_detect_area_2_body_entered(_body):
	if shifts[1] == false:
		shifts[1] = true
		var platforms = [
			$"platform-parent7",
			$"platform-parent8",
			$"platform-parent9",
			$"platform-parent10"
		]
		var time_disapear = 1.0
		
		for platform in platforms:
			await get_tree().create_timer(time_disapear).timeout
			platform.queue_free()
			time_disapear -= 0.2

func _on_detect_area_3_body_entered(_body):
	if shifts[2] == false:
		shifts[2] = true
		$"platform-parent12".queue_free()
		await get_tree().create_timer(3.0).timeout
		
		var platform = $"platform-parent15"
		var anim_player = $"platform-parent15/Platform/AnimationPlayer"
		CustomAnimations.two_key_frames_with_time(platform, anim_player, [0,0,0], [0,-800,5])
		anim_player.connect("animation_finished", CustomAnimations._on_animation_finished.bind(platform))
