extends Area2D

var lava_rock = preload("res://scenes/lava_rock.tscn")

func _ready() -> void:
	$Timer.start()

func _on_timer_timeout() -> void:
	var lava = lava_rock.instantiate()
	get_parent().add_child(lava)
	lava.global_position = $Marker2D.global_position
