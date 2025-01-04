extends Area2D

var speed = 250
var direction = 1

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	position.y += speed * direction * delta
