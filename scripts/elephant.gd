extends RigidBody2D

@export var climb_markers : Node2D

func _ready() -> void:
	GlobalSignals.elephant_climb.connect(_elephant_climb)

func _elephant_climb():
	gravity_scale = 0.0
	var markers = climb_markers.get_children()
	for marker in markers:
		var climb_tween = create_tween()
		climb_tween.tween_property(self, "global_position", marker.global_position, 0.5)
		await climb_tween.finished
