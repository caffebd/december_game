extends Control

var stone_count = 6
var score_count = 0
var my_life = 3

func _ready() -> void:
	$item_count.text = "stone need : "+str(stone_count)
	$timer_label.text = "Time : "+str(time)
	$life_count.text = "Life : "+str(my_life)
	$score_count.text = "Score : "+str(score_count)
	GlobalSignals.update_life.connect(_update_life)
	GlobalSignals.lost_stone.connect(_lost_stone)
	GlobalSignals.update_stone.connect(_update_stone)
	GlobalSignals.life_lost.connect(_life_lost)
	GlobalSignals.sign_text.connect(_sign_text)
	GlobalSignals.update_score.connect(_update_score)
	GlobalSignals.elephant_saved.connect(_elephant_saved)

var time = 20

func _on_time_timeout() -> void:
	time -= 1
	$timer_label.text = "Time : "+str(time)
	if time == 0:
		$time.stop()

func _elephant_saved():
	%win_ui.visible = true
	
	

func _update_stone():
	stone_count += 1
	$item_count.text = "stone need : "+str(stone_count)

func _update_score():
	score_count += 5
	$score_count.text = "Score : "+str(score_count)

func _lost_stone():
	stone_count -= 1
	$item_count.text = "stone need : "+str(stone_count)
	if stone_count == 0:
		GlobalSignals.sign_text.emit("Now throw all stone into the hole to save the elephant.")

func _sign_text(text):
	$sign_text.text = ""+str(text)
	$sign_text.visible = true

func _update_life():
	my_life += 1
	print(my_life)
	$life_count.text = "Life : "+str(my_life)

func _life_lost():
	my_life -= 1
	$life_count.text = "Life : "+str(my_life)
	print(my_life)
	if my_life == 0:
		call_deferred("change_scene")

func change_scene():
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")

func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")
