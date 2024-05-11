extends Node2D

const CustomAnimations = preload("res://scripts/custom_animations.gd")
var shifts = []
const screenWidth = 1300

func _ready():
	for i in range(4):
		shifts.append(false)

func _on_detect_area_4_body_entered(_body):
	if shifts[3] == false:
		shifts[3] = true
		var platform = $"Sawblade-Parent"
		var anim_player = $"Sawblade-Parent/Sawblade/AnimationPlayer"
		CustomAnimations.two_key_frames_with_time(platform, anim_player, [0,0,0], [screenWidth,0,5.0])
		anim_player.connect("animation_finished", CustomAnimations._on_animation_finished.bind(platform))

func _on_detect_area_body_entered(_body):
	if shifts[0] == false:
		shifts[0] = true
		var platform = $"Sawblade-Parent2"
		var anim_player = $"Sawblade-Parent2/Sawblade/AnimationPlayer"
		CustomAnimations.two_key_frames_with_time(platform, anim_player, [0,0,0], [-screenWidth,0,5.2])
		anim_player.connect("animation_finished", CustomAnimations._on_animation_finished.bind(platform))

func _on_detect_area_2_body_entered(_body):
	if shifts[1] == false:
		shifts[1] = true
		var platform = $"Sawblade-Parent3"
		var anim_player = $"Sawblade-Parent3/Sawblade/AnimationPlayer"
		CustomAnimations.four_key_frames_with_time(
			platform, 
			anim_player, 
			[0,0,0], 
			[screenWidth * 0.75,0,5.2 * 0.75], 
			[screenWidth * 0.75,0,(5.2 * 0.75) + 2], 
			[0,0,(5.2 * 0.75) * 2 + 2]
		)
		anim_player.connect("animation_finished", CustomAnimations._on_animation_finished.bind(platform))

func _on_detect_area_3_body_entered(_body):
	if shifts[2] == false:
		shifts[2] = true
		var platform = $"Sawblade-Parent4"
		var anim_player = $"Sawblade-Parent4/Sawblade/AnimationPlayer"
		CustomAnimations.six_key_frames_with_time(
			platform, 
			anim_player, 
			[0,0,0], 
			[-90,0,0.3], 
			[-90,0,3.3], 
			[-(screenWidth * 0.7),0,(5.2 * 0.7) + 3,3],
			[-(screenWidth * 0.7),0,(5.2 * 0.7) + 4,3],
			[0,0,(5.2 * 0.7) * 2 + 4,3]
		)
		anim_player.connect("animation_finished", CustomAnimations._on_animation_finished.bind(platform))
