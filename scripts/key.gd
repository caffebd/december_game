extends Area2D

var key_text = "Door Open"

func _ready() -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalSignals.key_collected.emit()
		GlobalSignals.sign_text.emit(key_text)
		queue_free()
