extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var is_init = false

var wait_time = null

func enter():
	get_parent().clear_path()
	wait_time = 1
	
func exit():
	pass
	
func state_update(delta):
	wait_time -= delta
	
	if wait_time <= 0:
		get_parent().change_state(get_parent().get_node("walker_persue_state"))

