extends Control

func _ready() -> void:
	GlobalSignals.connect("update_score", self, "_update_score")
	$timer_label.text = "Time : "+str(time)

var time = 20

func _on_time_timeout() -> void:
	time += -1
	$timer_label.text = "Time : "+str(time)
	if time == 0:
		$time.stop()

func _update_score():
	pass
