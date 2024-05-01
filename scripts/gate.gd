extends Area2D

func _ready():
	$Player.hide()

func _on_body_entered(body):
	body.queue_free()
	$Player.show()
	$AnimationPlayer.play("gate_animation")

func _on_animation_player_animation_finished(anim_name):
	$AnimationPlayer.play("RESET")
	get_tree().change_scene_to_file("res://scenes/control.tscn")
