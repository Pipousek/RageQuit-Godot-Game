extends Node2D

const CustomAnimations = preload("res://scripts/custom_animations.gd")

var shifts = []

func _ready():
	for i in range(3):
		shifts.append(false)
	
	var platform = $"platform-parent97"
	var anim_player = $"platform-parent97/Platform/AnimationPlayer"
	CustomAnimations.three_key_freames(platform, anim_player, [0,0], [0,-90], [60,-90])

func _on_detect_area_body_entered(body):
	if shifts[0] == false:
		shifts[0] = true
		var platform = $"platform-parent3"
		var anim_player = $"platform-parent3/Platform/AnimationPlayer"
		CustomAnimations.two_key_freames(platform, anim_player, [0,0], [0,270])
		anim_player.connect("animation_finished", _on_animation_finished)
		print("start-level-02")
		await get_tree().create_timer(2.0).timeout
		print("end-level-02")
		$"platform-parent5/Platform/AnimationPlayer".play("shift-left")

func _on_animation_finished(anim_name):
	$"platform-parent3".queue_free()

func _on_detect_area_2_body_entered(body):
	if shifts[1] == false:
		shifts[1] = true
		var platforms = [
			$"platform-parent7",
			$"platform-parent8",
			$"platform-parent9",
		]
		
		for platform in platforms:
			await get_tree().create_timer(1.0).timeout
			platform.queue_free()

func _on_detect_area_3_body_entered(body):
	pass # Replace with function body.
