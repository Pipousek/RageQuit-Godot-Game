extends Node2D

const CustomAnimations = preload("res://scripts/custom_animations.gd")
var shifts = []

func _ready():
	for i in range(3):
		shifts.append(false)

func _on_detect_area_body_entered(_body):
	if shifts[0] == false:
		shifts[0] = true
		var spikes = $"Spikes-Parent"
		var anim_player_spikes = $"Spikes-Parent/Spikes/AnimationPlayer"
		CustomAnimations.two_key_frames_with_time(spikes, anim_player_spikes, [0,0,0], [0,-13,0.2])

func _on_detect_area_2_body_entered(_body):
	if shifts[1] == false:
		shifts[1] = true
		$Player.SPEED = 1200
		$Player.SWAP_DIRECTION = -1
		var spikes = $"Spikes-Parent2"
		var anim_player_spikes = $"Spikes-Parent2/Spikes/AnimationPlayer"
		CustomAnimations.two_key_frames_with_time(spikes, anim_player_spikes, [0,0,0], [0,-13,0.2])

func _on_detect_area_3_body_entered(_body):
	if shifts[2] == false:
		shifts[2] = true
		$"Gate-Parrent".queue_free()
		
		var gate2 = $"Gate-Parrent2"
		var anim_player_gate2 = $"Gate-Parrent2/Gate/ParrentAnimationPlayer"
		CustomAnimations.two_key_frames_with_time(gate2, anim_player_gate2, [0,0,0], [65,0,0.3])
