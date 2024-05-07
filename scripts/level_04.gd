extends Node2D

const CustomAnimations = preload("res://scripts/custom_animations.gd")
var shifts = []

func _ready():
	for i in range(3):
		shifts.append(false)
	
	await get_tree().create_timer(2.0).timeout
	var platform = $"Spikes-Parent"
	var anim_player = $"Spikes-Parent/Spikes/AnimationPlayer"
	CustomAnimations.two_key_frames_with_time(platform, anim_player, [0,0,0], [-51,0,2.0])
	#anim_player.connect("animation_finished", CustomAnimations._on_animation_finished.bind(platform))

func _on_detect_area_body_entered(_body):
	if shifts[0] == false:
		shifts[0] = true
		var platform = $"Spikes-Parent3"
		var anim_player = $"Spikes-Parent3/Spikes/AnimationPlayer"
		CustomAnimations.two_key_frames_with_time(platform, anim_player, [0,0,0], [51,0,0.3])

func _on_detect_area_2_body_entered(_body):
	if shifts[1] == false:
		shifts[1] = true
		var platform = $"Spikes-Parent5"
		var anim_player = $"Spikes-Parent5/Spikes/AnimationPlayer"
		CustomAnimations.two_key_frames_with_time(platform, anim_player, [0,0,0], [-51,0,0.2])

func _on_detect_area_3_body_entered(_body):
	if shifts[2] == false:
		shifts[2] = true
		var platform = $"Spikes-Parent6"
		var anim_player = $"Spikes-Parent6/Spikes/AnimationPlayer"
		CustomAnimations.two_key_frames_with_time(platform, anim_player, [0,0,0], [0,-13,0.2])
