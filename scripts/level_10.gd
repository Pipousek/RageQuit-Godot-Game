extends Node2D

const CustomAnimations = preload("res://scripts/custom_animations.gd")
var shifts = []

func _ready():
	for i in range(5):
		shifts.append(false)

func _on_detect_area_body_entered(_body):
	if shifts[0] == false:
		shifts[0] = true
		var gate = $"Gate-Parrent"
		var anim_player_gate = $"Gate-Parrent/Gate/ParrentAnimationPlayer"
		CustomAnimations.two_key_frames_with_time(gate, anim_player_gate, [0,0,0], [160,0,0.2])
		#anim_player_gate.connect("animation_finished", CustomAnimations._on_animation_finished.bind(gate))
		
		var spikes = $"Spikes-Parent"
		var anim_player_spikes = $"Spikes-Parent/Spikes/AnimationPlayer"
		CustomAnimations.two_key_frames_with_time(spikes, anim_player_spikes, [0,0,0], [0,-13,0.2])
		#anim_player_spikes.connect("animation_finished", CustomAnimations._on_animation_finished.bind(spikes))

func _on_detect_area_2_body_entered(_body):
	if shifts[1] == false:
		shifts[1] = true
		var gate = $"Gate-Parrent"
		var anim_player_gate = $"Gate-Parrent/Gate/ParrentAnimationPlayer"
		CustomAnimations.two_key_frames_with_time(gate, anim_player_gate, [160,0,0], [650,0,1.0])

func _on_detect_area_3_body_entered(_body):
	if shifts[2] == false:
		shifts[2] = true
		var gate = $"Gate-Parrent"
		var anim_player_gate = $"Gate-Parrent/Gate/ParrentAnimationPlayer"
		CustomAnimations.two_key_frames_with_time(gate, anim_player_gate, [650,0,0], [950,0,0.5])
		
		var platform = $"Platform-Parent2"
		var anim_player_platform = $"Platform-Parent2/Platform/AnimationPlayer"
		CustomAnimations.two_key_frames_with_time(platform, anim_player_platform, [0,0,0], [0,135,0.3])
		#anim_player_platform.connect("animation_finished", CustomAnimations._on_animation_finished.bind(platform))

func _on_detect_area_4_body_entered(_body):
	if shifts[3] == false:
		shifts[3] = true
		var spikes = $"Spikes-Parent2"
		var anim_player_spikes = $"Spikes-Parent2/Spikes/AnimationPlayer"
		CustomAnimations.two_key_frames_with_time(spikes, anim_player_spikes, [0,0,0], [0,-13,0.2])


func _on_detect_area_5_body_entered(_body):
	if shifts[4] == false:
		shifts[4] = true
		var gate = $"Gate-Parrent"
		var anim_player_gate = $"Gate-Parrent/Gate/ParrentAnimationPlayer"
		CustomAnimations.two_key_frames_with_time(gate, anim_player_gate, [950,0,0], [1100,0,0.5])
		anim_player_gate.connect("animation_finished", CustomAnimations._on_animation_finished.bind(gate))
		
		var gate2 = $"Gate-Parrent2"
		var anim_player_gate2 = $"Gate-Parrent2/Gate/ParrentAnimationPlayer"
		CustomAnimations.two_key_frames_with_time(gate2, anim_player_gate2, [0,0,0], [60,0,0.5])
		
		var sawblade = $"Sawblade-Parent"
		var anim_player_sawblade = $"Sawblade-Parent/Sawblade/AnimationPlayer"
		CustomAnimations.two_key_frames_with_time(sawblade, anim_player_sawblade, [0,0,0], [-1170,0,8.0])

func _on_detect_area_6_body_entered(_body):
	if shifts[5] == false and shifts[4] == true:
		shifts[5] = true
		var spikes = $"Spikes-Parent3"
		var anim_player_spikes = $"Spikes-Parent3/Spikes/AnimationPlayer"
		CustomAnimations.two_key_frames_with_time(spikes, anim_player_spikes, [0,0,0], [0,-13,0.2])
