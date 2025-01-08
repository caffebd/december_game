extends CharacterBody2D

@onready var stone = preload("res://scenes/stone.tscn")

var speed = 300.0
const JUMP_VELOCITY = -400.0
const FLOWER_JUMP_VELOCITY = -500.0

var stones = 6

func _ready() -> void:
	GlobalSignals.player_speed.connect(_player_speed)
	GlobalSignals.flower_jump.connect(_flower_jump)
	GlobalSignals.stone_collected.connect(_stone_collected)

func _player_speed(new_speed):
	speed = new_speed
	$SpeedPowerUp.start()

func _stone_collected():
	stones += 1

func _flower_jump():
	%PlayerAnim.play("idle")
	velocity.y = FLOWER_JUMP_VELOCITY

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("throw") and stones > 0:
		stones -= 1
		var stone_load = stone.instantiate()
		stone_load.global_position = %stones_start.global_position
		get_parent().add_child(stone_load)
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		%PlayerAnim.play("idle")
		velocity.y = JUMP_VELOCITY
	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
		%PlayerAnim.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		%PlayerAnim.play("idle")
	
	if velocity.x > 0:
		%PlayerAnim.scale.x = 1
	if velocity.x < 0:
		%PlayerAnim.scale.x = -1
	
	
	move_and_slide()


func _on_speed_power_up_timeout() -> void:
	speed = 300.0
