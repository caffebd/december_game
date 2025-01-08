extends Area2D

var jumping = false

func _ready() -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and not jumping:
		jumping = true
		GlobalSignals.flower_jump.emit()
		$flower_jump_anim.play("jump")
		print(body.name)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		print(body.name)
		jumping = false
