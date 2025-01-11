extends RigidBody2D

func _on_lava_rock_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalSignals.life_lost.emit()
		queue_free()
	if body.is_in_group("world"):
		queue_free()
	if body.is_in_group("others"):
		queue_free()
