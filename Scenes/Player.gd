extends KinematicBody2D

export (int) var speed = 200
export (int) var jump_speed = -800
export (int) var gravity = 4000

var velocity = Vector2.ZERO

export (float, 0, 1.0) var friction = 0.3
export (float, 0, 1.0) var acceleration = 0.25

func get_input():
	var dir = 0
	if Input.is_action_pressed("right"):
		dir += 1
	if Input.is_action_pressed("left"):
		dir -= 1
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("up"):
		if is_on_floor():
			velocity.y = jump_speed
