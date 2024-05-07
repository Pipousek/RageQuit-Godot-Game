extends Control

func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://scenes/level_01.tscn")

func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://scenes/level_02.tscn")

func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://scenes/level_03.tscn")
