extends Area2D

func _on_body_entered(body):
	call_deferred("_change_scene")

func _change_scene():
	# Retrieve the current scene's path
	var scene_path = get_tree().current_scene.scene_file_path
	print(scene_path)
	# Use change_scene instead of change_scene_to_file
	get_tree().change_scene_to_file(scene_path)
