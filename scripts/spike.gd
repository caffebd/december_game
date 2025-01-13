extends Area2D

@export var move_to = Vector2(100,0)

@export var move_time = 1.0

var start_pos = Vector2(200,0)
var target_pos = Vector2.ZERO

var direction = 1

func _ready() -> void:
	$spike_anim.play("attack")
	$attack_timer.start()
	start_pos = global_position
	_spike_attack()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalSignals.life_lost.emit()
		

func _spike_attack():
	if direction == 1:
		target_pos = start_pos + move_to
	else:
		target_pos = start_pos
	
	var tween = create_tween()
	tween.tween_property(self, "global_position", target_pos, move_time)

func _on_attack_timer_timeout() -> void:
	direction *= -1
	_spike_attack()
