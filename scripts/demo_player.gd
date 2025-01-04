extends CharacterBody2D

@onready var stone = preload("res://scenes/stone.tscn")

var speed = 300.0
const JUMP_VELOCITY = -400.0

func _ready() -> void:
	GlobalSignals.player_speed.connect(_player_speed)
	

func _player_speed(new_speed):
	speed = new_speed
	$SpeedPowerUp.start()

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("throw"):
		var stone_load = stone.instantiate()
		stone_load.direction = 1
		add_child(stone_load)
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	%PlayerAnim.flip_h = velocity.x < 0
	

	move_and_slide()


func _on_speed_power_up_timeout() -> void:
	speed = 300.0
