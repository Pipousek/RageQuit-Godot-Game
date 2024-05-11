extends Node2D

const CustomAnimations = preload("res://scripts/custom_animations.gd")
var shifts = []

func _ready():
	for i in range(1):
		shifts.append(false)

func _on_detect_area_body_entered(_body):
	if shifts[0] == false:
		shifts[0] = true
		$Player.SPEED = 30
		$Player.SWAP_DIRECTION = -1
		var platform = $"Sawblade-Parent"
		var anim_player = $"Sawblade-Parent/Sawblade/AnimationPlayer"
		CustomAnimations.two_key_frames_with_time(platform, anim_player, [0,0,0], [1300,0,21.0])
		anim_player.connect("animation_finished", CustomAnimations._on_animation_finished.bind(platform))
