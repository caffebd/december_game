extends RigidBody2D

var speed = 150.0

func _ready() -> void:
	$walk_timer.start()

func _on_walk_timer_timeout() -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
