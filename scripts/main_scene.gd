extends Node2D


func _on_easy_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/easy_game.tscn")

func _on_hard_buttton_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_level.tscn")
