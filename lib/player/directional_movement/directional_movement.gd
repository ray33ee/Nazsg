extends Node2D

export (float) var speed = 100

var vec = Vector2()

func calculate_movement():
	var v = Vector2()
	if Input.is_action_pressed("right"):
		v.x += 1
	if Input.is_action_pressed("left"):
		v.x -= 1
	if Input.is_action_pressed("down"):
		v.y += 1
	if Input.is_action_pressed("up"):
		v.y -= 1
		
	get_parent().linear_velocity = v.normalized() * speed


