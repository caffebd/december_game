extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print(body.name)
		#GlobalSignals.stone_follow.emit()
		call_deferred("_do_reload")
	if body.is_in_group("stone"):
		body.follow_player = true

func _do_reload():
	get_tree().reload_current_scene()
