extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var is_init = false

func enter():
	var points = [Vector2(randf() * 200, randf() * 200)]
	get_parent().set_path(points)
	
func exit():
	pass
	
func state_update(delta):
	if get_parent().points_left() == 0:
		get_parent().change_state(get_parent().get_node("walker_idle_state"))
	
	

