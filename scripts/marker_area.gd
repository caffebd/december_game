extends Area2D

var current_marker = 0

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("stone"):
		body.pit_drop()
		var to_marker = get_parent().get_child(current_marker)
		current_marker += 1
		var stone_tween = create_tween()
		stone_tween.tween_property(body, "global_position", to_marker.global_position, 0.5)
		
		if current_marker == 6:
			GlobalSignals.elephant_climb.emit()
			
