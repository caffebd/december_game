extends Area2D

func _on_body_entered(body: Node2D) -> void:
	queue_free()
	GlobalSignals.emit_signal("update_score")