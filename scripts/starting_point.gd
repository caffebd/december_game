extends Area2D

var player_scene = preload("res://scenes/demo_player.tscn")

func _ready() -> void:
	pass

func _make_player():
	var player = player_scene.instantiate()
	
