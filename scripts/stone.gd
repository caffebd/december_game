extends RigidBody2D

func _ready() -> void:
	pass

func pit_drop():
	gravity_scale = 0.0
	linear_velocity = Vector2.ZERO
	$stone_area/CollisionShape2D.set_deferred("disabled", true)

func _on_stone_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalSignals.stone_collected.emit()
		queue_free()
