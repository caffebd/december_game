extends Control

var coin_count = 6

func _ready() -> void:
	$item_count.text = "Left : "+str(coin_count)
	$timer_label.text = "Time : "+str(time)
	GlobalSignals.update_score.connect(_update_score)

var time = 20

func _on_time_timeout() -> void:
	time += -1
	$timer_label.text = "Time : "+str(time)
	if time == 0:
		$time.stop()

func _update_score():
	coin_count -= 1
	$item_count.text = "Left : "+str(coin_count)
