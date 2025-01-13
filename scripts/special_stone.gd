extends RigidBody2D

func _ready() -> void:
	GlobalSignals.key_collected.connect(_stone_show)
	$CollisionShape2D.set_deferred("disabled", true)
	$special_stone_area/CollisionShape2D.set_deferred("disabled", true)

func pit_drop():
	gravity_scale = 0.0
	linear_velocity = Vector2.ZERO
	$stone_area/CollisionShape2D.set_deferred("disabled", true)

func _on_special_stone_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalSignals.stone_collected.emit()
		GlobalSignals.update_stone.emit()
		queue_free()

func _stone_show():
	visible = true
	$CollisionShape2D.set_deferred("disabled", false)
	$special_stone_area/CollisionShape2D.set_deferred("disabled", false)
