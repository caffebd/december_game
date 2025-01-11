extends CharacterBody2D

var pit_dropped = false

var run_speed = 100
var player = null

func _ready() -> void:
	pass
	#GlobalSignals.stone_follow.connect(_stone_follow)

func pit_drop():
	#gravity_scale = 0.0
	#linear_velocity = Vector2.ZERO
	pit_dropped = true
	$stone_area/CollisionShape2D.set_deferred("disabled", true)

#func _stone_follow(object):
	#player = object
	#GlobalVars.stone_follow = true

func _physics_process(delta: float) -> void:
	
	if pit_dropped: return
	
	if not is_on_floor() and not pit_dropped:
		velocity += get_gravity() * delta
		
	if GlobalVars.stone_follow == true:
		velocity = Vector2.ZERO
			
		if player:
			velocity = position.direction_to(player.position) * run_speed
	move_and_slide()


func _on_stone_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
		GlobalSignals.stone_collected.emit()
		queue_free()
		if GlobalVars.stone_follow == true:
			GlobalVars.stone_follow = false
