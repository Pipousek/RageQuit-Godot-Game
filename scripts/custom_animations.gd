extends Node

static func three_key_freames(platform, anim_player, first_key, second_key, third_key):
	var scaleX = platform.scale.x
	var scaleY = platform.scale.y
	
	var anim = anim_player.get_animation("tmp-3-key-frames")
	if anim:
		anim.track_set_key_value(0,0,Vector2(first_key[0] / scaleX,first_key[1] / scaleY))
		anim.track_set_key_value(0,1,Vector2(second_key[0] / scaleX,second_key[1] / scaleY))
		anim.track_set_key_value(0,2,Vector2(third_key[0] / scaleX,third_key[1] / scaleY))
		anim_player.play("tmp-3-key-frames")

static func two_key_freames(platform, anim_player, first_key, second_key):
	var scaleX = platform.scale.x
	var scaleY = platform.scale.y
	
	var anim = anim_player.get_animation("tmp-2-key-frames")
	if anim:
		anim.track_set_key_value(0,0,Vector2(first_key[0] / scaleX,first_key[1] / scaleY))
		anim.track_set_key_value(0,1,Vector2(second_key[0] / scaleX,second_key[1] / scaleY))
		anim_player.play("tmp-2-key-frames")

static func two_key_freames_with_time(platform, anim_player, first_key, second_key):
	var scaleX = platform.scale.x
	var scaleY = platform.scale.y
	
	var anim = anim_player.get_animation("tmp-2-key-frames")
	if anim:
		anim.track_set_key_value(0,0,Vector2(first_key[0] / scaleX,first_key[1] / scaleY))
		anim.track_set_key_time(0,0, first_key[2])
		anim.track_set_key_value(0,1,Vector2(second_key[0] / scaleX,second_key[1] / scaleY))
		anim.track_set_key_time(0,1, second_key[2])
		anim_player.play("tmp-2-key-frames")
