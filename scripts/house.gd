extends Area2D

func _ready() -> void:
	GlobalSignals.key_collected.connect(_key_collected)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$lock_label.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		$lock_label.visible = false

func _key_collected():
	$lock_label.text = "Door Unlocked"
