extends Area2D

@export var new_speed: float = 500.0

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalSignals.player_speed.emit(new_speed)
		queue_free()
