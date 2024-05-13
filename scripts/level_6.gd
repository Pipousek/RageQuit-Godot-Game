extends Node2D

const CustomAnimations = preload("res://scripts/custom_animations.gd")
var shifts = []
var sawblade_lock = []

var min_value = 0.1
var max_value = 2.0
var min_second_value = 0.8
var max_second_value = 1.5

var sawblades
var sawblade_anim_players

func _ready():
	shifts.append(false)
	for i in range(8):
		sawblade_lock.append(false)
	
	sawblades = _get_sawblade_list()
	sawblade_anim_players = _get_sawblade_anim_players_list()

func _process(_delta):
	drop_sawblade(sawblades[0], sawblade_anim_players[0], 0, randf_range(min_value, max_value), randf_range(min_second_value, max_second_value))
	drop_sawblade(sawblades[1], sawblade_anim_players[1], 1, randf_range(min_value, max_value), randf_range(min_second_value, max_second_value))
	drop_sawblade(sawblades[2], sawblade_anim_players[2], 2, randf_range(min_value, max_value), randf_range(min_second_value, max_second_value))
	drop_sawblade(sawblades[3], sawblade_anim_players[3], 3, randf_range(min_value, max_value), randf_range(min_second_value, max_second_value))
	drop_sawblade(sawblades[4], sawblade_anim_players[4], 4, randf_range(min_value, max_value), randf_range(min_second_value, max_second_value))
	drop_sawblade(sawblades[5], sawblade_anim_players[5], 5, randf_range(min_value, max_value), randf_range(min_second_value, max_second_value))
	drop_sawblade(sawblades[6], sawblade_anim_players[6], 6, randf_range(min_value, max_value), randf_range(min_second_value, max_second_value))
	drop_sawblade(sawblades[7], sawblade_anim_players[7], 7, randf_range(min_value, max_value), randf_range(min_second_value, max_second_value))

func _on_detect_area_body_entered(_body):
	if shifts[0] == false:
		shifts[0] = true
		var spikes = $"Spikes-Parent"
		var anim_player_spikes = $"Spikes-Parent/Spikes/AnimationPlayer"
		CustomAnimations.two_key_frames_with_time(spikes, anim_player_spikes, [0,0,0], [0,-13,0.2])

func drop_sawblade(sawblade, anim_player, lock_id, wait_time, fall_time):
	if not sawblade_lock[lock_id]:
		sawblade_lock[lock_id] = true
		CustomAnimations.two_key_frames_with_time(sawblade, anim_player, [0,0,0], [0,246,fall_time])
		await get_tree().create_timer(wait_time + fall_time).timeout
		sawblade_lock[lock_id] = false

func _get_sawblade_list():
	return [
		$"Sawblade-Parent",
		$"Sawblade-Parent2",
		$"Sawblade-Parent3",
		$"Sawblade-Parent4",
		$"Sawblade-Parent5",
		$"Sawblade-Parent6",
		$"Sawblade-Parent7",
		$"Sawblade-Parent8"
	]

func _get_sawblade_anim_players_list():
	return [
		$"Sawblade-Parent/Sawblade/AnimationPlayer",
		$"Sawblade-Parent2/Sawblade/AnimationPlayer",
		$"Sawblade-Parent3/Sawblade/AnimationPlayer",
		$"Sawblade-Parent4/Sawblade/AnimationPlayer",
		$"Sawblade-Parent5/Sawblade/AnimationPlayer",
		$"Sawblade-Parent6/Sawblade/AnimationPlayer",
		$"Sawblade-Parent7/Sawblade/AnimationPlayer",
		$"Sawblade-Parent8/Sawblade/AnimationPlayer"
	]
