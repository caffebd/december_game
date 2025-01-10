extends Area2D

func _ready() -> void:
	$spike_anim.play("attack")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		call_deferred("_reload_scene")
		GlobalSignals.life_lost.emit()

func _reload_scene():
	get_tree().reload_current_scene()
