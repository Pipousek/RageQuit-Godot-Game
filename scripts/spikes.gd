extends Area2D

func _on_body_entered(body):
	call_deferred("_change_scene")

func _change_scene():
	var scene_path = get_tree().current_scene.scene_file_path
	print(scene_path)
	get_tree().change_scene_to_file(scene_path)

func test():
	print("D")
