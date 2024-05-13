extends Node2D

const CustomAnimations = preload("res://scripts/custom_animations.gd")
var pressed = []
var scales = [
	Vector2(0.2,0.2),
	Vector2(2,6),
	Vector2(5,2)
]

func _ready():
	$Player.SPEED = 350
	for i in range(3):
		pressed.append(false)
	scales.shuffle()
	print(scales)

func _apply_scale_on_player(scale_vector):
	$Player/Sprite2D.scale = scale_vector
	$Player/CollisionShape2D.scale = scale_vector

func _check_states():
	if not false in pressed:
		var spikes = $"Spikes-Parent"
		var anim_player_spikes = $"Spikes-Parent/Spikes/AnimationPlayer"
		CustomAnimations.two_key_frames_with_time(spikes, anim_player_spikes, [0,0,0], [0,-13,0.2])
		
		var platform = $"Platform-Parent3"
		var anim_player = $"Platform-Parent3/Platform/AnimationPlayer"
		CustomAnimations.two_key_frames_with_time(platform, anim_player, [0,0,0], [20,0,1.0])
		anim_player.connect("animation_finished", CustomAnimations._on_animation_finished.bind(platform))

func _on_game_button_body_entered(_body):
	if pressed[0] == false:
		pressed[0] = true
		_check_states()
		_apply_scale_on_player(scales[0])

func _on_game_button_2_body_entered(_body):
	if pressed[1] == false:
		pressed[1] = true
		_check_states()
		_apply_scale_on_player(scales[1])

func _on_game_button_3_body_entered(_body):
	if pressed[2] == false:
		pressed[2] = true
		_check_states()
		_apply_scale_on_player(scales[2])
