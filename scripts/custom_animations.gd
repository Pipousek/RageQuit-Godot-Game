extends Node

### ANIMATION FINISHED CONNECT ###
static func _on_animation_finished(_anim_name, platform):
	platform.queue_free()
	print("FREE: " + platform.name)

### BASIC FRAMES ###
static func two_key_frames(platform, anim_player, first_key, second_key):
	var scaleX = platform.scale.x
	var scaleY = platform.scale.y
	
	var anim = anim_player.get_animation("Global/tmp-2-key-frames")
	if anim:
		anim.track_set_key_value(0,0,Vector2(first_key[0] / scaleX,first_key[1] / scaleY))
		anim.track_set_key_value(0,1,Vector2(second_key[0] / scaleX,second_key[1] / scaleY))
		anim_player.play("Global/tmp-2-key-frames")

static func three_key_frames(platform, anim_player, first_key, second_key, third_key):
	var scaleX = platform.scale.x
	var scaleY = platform.scale.y
	
	var anim = anim_player.get_animation("Global/tmp-3-key-frames")
	if anim:
		anim.track_set_key_value(0,0,Vector2(first_key[0] / scaleX,first_key[1] / scaleY))
		anim.track_set_key_value(0,1,Vector2(second_key[0] / scaleX,second_key[1] / scaleY))
		anim.track_set_key_value(0,2,Vector2(third_key[0] / scaleX,third_key[1] / scaleY))
		anim_player.play("Global/tmp-3-key-frames")

static func four_key_frames(platform, anim_player, first_key, second_key, third_key, fourth_key):
	var scaleX = platform.scale.x
	var scaleY = platform.scale.y
	
	var anim = anim_player.get_animation("Global/tmp-4-key-frames")
	if anim:
		anim.track_set_key_value(0,0,Vector2(first_key[0] / scaleX,first_key[1] / scaleY))
		anim.track_set_key_value(0,1,Vector2(second_key[0] / scaleX,second_key[1] / scaleY))
		anim.track_set_key_value(0,2,Vector2(third_key[0] / scaleX,third_key[1] / scaleY))
		anim.track_set_key_value(0,3,Vector2(fourth_key[0] / scaleX,fourth_key[1] / scaleY))
		anim_player.play("Global/tmp-4-key-frames")


### TIMED FRAMES ###
static func two_key_frames_with_time(platform, anim_player, first_key, second_key):
	var scaleX = platform.scale.x
	var scaleY = platform.scale.y
	var anim_player_library = anim_player.get_animation_library("Global")
	
	var anim = Animation.new()
	var anim_old = anim_player.get_animation("Global/tmp-2-key-frames-timed")
	anim_old.copy_track(0, anim)
	var anim_name = "tmp-2-key-frames-timed-" + platform.name
	if anim:
		anim.length = second_key[2]
		anim.track_set_key_time(0,0, first_key[2])
		anim.track_set_key_value(0,0,Vector2(first_key[0] / scaleX,first_key[1] / scaleY))
		anim.track_set_key_time(0,1, second_key[2])
		anim.track_set_key_value(0,1,Vector2(second_key[0] / scaleX,second_key[1] / scaleY))
		var err = anim_player_library.add_animation(anim_name, anim)
		if err:
			printerr("Fail: two_key_frames_with_time!")
		anim_player.play("Global/" + anim_name)

static func three_key_frames_with_time(platform, anim_player, first_key, second_key, third_key):
	var scaleX = platform.scale.x
	var scaleY = platform.scale.y
	
	var anim = anim_player.get_animation("Global/tmp-3-key-frames-timed")
	if anim:
		anim.length = third_key[2]
		anim.track_set_key_time(0,0, first_key[2])
		anim.track_set_key_value(0,0,Vector2(first_key[0] / scaleX,first_key[1] / scaleY))
		anim.track_set_key_time(0,1, second_key[2])
		anim.track_set_key_value(0,1,Vector2(second_key[0] / scaleX,second_key[1] / scaleY))
		anim.track_set_key_time(0,2, third_key[2])
		anim.track_set_key_value(0,2,Vector2(third_key[0] / scaleX,third_key[1] / scaleY))
		anim_player.play("Global/tmp-3-key-frames-timed")

static func four_key_frames_with_time(platform, anim_player, first_key, second_key, third_key, fourth_key):
	var scaleX = platform.scale.x
	var scaleY = platform.scale.y
	
	var anim = anim_player.get_animation("Global/tmp-4-key-frames-timed")
	if anim:
		anim.length = fourth_key[2]
		anim.track_set_key_time(0,0, first_key[2])
		anim.track_set_key_value(0,0,Vector2(first_key[0] / scaleX,first_key[1] / scaleY))
		anim.track_set_key_time(0,1, second_key[2])
		anim.track_set_key_value(0,1,Vector2(second_key[0] / scaleX,second_key[1] / scaleY))
		anim.track_set_key_time(0,2, third_key[2])
		anim.track_set_key_value(0,2,Vector2(third_key[0] / scaleX,third_key[1] / scaleY))
		anim.track_set_key_time(0,3, fourth_key[2])
		anim.track_set_key_value(0,3,Vector2(fourth_key[0] / scaleX,fourth_key[1] / scaleY))
		anim_player.play("Global/tmp-4-key-frames-timed", )
