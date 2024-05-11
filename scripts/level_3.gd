extends Node2D

const CustomAnimations = preload("res://scripts/custom_animations.gd")
var shifts = []

func _ready():
	for i in range(4):
		shifts.append(false)

func _on_detect_area_body_entered(_body):
	if shifts[0] == false:
		shifts[0] = true
		var platform = $"platform-parent3"
		print(platform.position)
		var anim_player = $"platform-parent3/Platform/AnimationPlayer"
		CustomAnimations.four_key_frames_with_time(platform, anim_player, [0,0,0], [0,-90,0.2], [-90,-90,0.5], [-90,0,1.5])
		anim_player.connect("animation_finished", CustomAnimations._on_animation_finished.bind(platform))

func _on_detect_area_2_body_entered(_body):
	if shifts[1] == false:
		shifts[1] = true
		var platform = $"platform-parent5"
		var anim_player = $"platform-parent5/Platform/AnimationPlayer"
		CustomAnimations.four_key_frames_with_time(platform, anim_player, [0,0,0], [0,-90,0.1], [0,-90,1.7], [0,0,2.5])
		anim_player.connect("animation_finished", CustomAnimations._on_animation_finished.bind(platform))

func _on_detect_area_3_body_entered(_body):
	if shifts[2] == false:
		shifts[2] = true
		var platform = $"platform-parent7"
		var anim_player = $"platform-parent7/Platform/AnimationPlayer"
		CustomAnimations.two_key_frames_with_time(platform, anim_player, [0,0,0], [0,150,0.25])
		anim_player.connect("animation_finished", CustomAnimations._on_animation_finished.bind(platform))

func _on_detect_area_4_body_entered(_body):
	if shifts[3] == false:
		shifts[3] = true
		var platform = $"platform-parent4"
		var anim_player = $"platform-parent4/Platform/AnimationPlayer"
		CustomAnimations.two_key_frames_with_time(platform, anim_player, [0,0,0], [360,0,1.5])
		anim_player.connect("animation_finished", CustomAnimations._on_animation_finished.bind(platform))
