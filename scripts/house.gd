extends Area2D

var door_unlocked = false
var stone_collected = false

func _ready() -> void:
	GlobalSignals.key_collected.connect(_key_collected)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$lock_label.visible = true
		if door_unlocked and not stone_collected:
			stone_collected = true
			$special_stone.stone_show()

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		$lock_label.visible = false
		

func _key_collected():
	$lock_label.text = "Door Unlocked"
	door_unlocked = true
	
