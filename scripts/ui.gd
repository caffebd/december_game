extends Control

var coin_count = 6
var my_life = 3

func _ready() -> void:
	$item_count.text = "Left : "+str(coin_count)
	$timer_label.text = "Time : "+str(time)
	$life_count.text = "Life : "+str(my_life)
	GlobalSignals.update_life.connect(_update_life)
	GlobalSignals.update_score.connect(_update_score)
	GlobalSignals.life_lost.connect(_life_lost)

var time = 20

func _on_time_timeout() -> void:
	time += -1
	$timer_label.text = "Time : "+str(time)
	if time == 0:
		$time.stop()

func _update_score():
	coin_count -= 1
	$item_count.text = "Left : "+str(coin_count)

func _update_life():
	my_life += 1
	print(my_life)
	$life_count.text = "Life : "+str(my_life)

func _life_lost():
	my_life -= 1
	$life_count.text = "Life : "+str(my_life)
	print(my_life)
	if my_life == 0:
		call_deferred("reload_scene")

func reload_scene():
	get_tree().reload_current_scene()
