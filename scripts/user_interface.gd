extends Control

func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://scenes/world_2.tscn")
