extends CharacterBody2D

var pit_dropped = false

var player

func _ready() -> void:
	pass

func pit_drop():
	#gravity_scale = 0.0
	#linear_velocity = Vector2.ZERO
	pit_dropped = true
	$stone_area/CollisionShape2D.set_deferred("disabled", true)

func _physics_process(delta: float) -> void:
	if not is_on_floor() and not pit_dropped:
		velocity += get_gravity() * delta


func _on_stone_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalSignals.stone_collected.emit()
		queue_free()
