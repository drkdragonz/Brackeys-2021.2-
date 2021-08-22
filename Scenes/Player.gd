extends KinematicBody2D

var speed = 200  # speed in pixels/sec
var velocity = Vector2.ZERO

var health = 3

func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	# Make sure diagonal movement isn't faster

	velocity = velocity.normalized() * speed

func _physics_process(delta):
	if health <= 0:
		queue_free()
	get_input()
	velocity = move_and_slide(velocity)


func _on_Area2D_area_entered(area):
	if area.is_in_group("enemy"):
		health -= 1
		print("hit")
		print(health)

