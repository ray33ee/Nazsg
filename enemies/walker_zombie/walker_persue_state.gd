extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var is_init = true

var countdown = null

func enter():
	
	countdown = 1
	
	var entity = get_parent().get_parent()
	var map = entity.get_parent()
	var navi = map.get_parent()
	
	# Pick a point to move to, random atm
	var destination = map.get_node("player").position
	
	var points = navi.get_simple_path(entity.position, destination)
	
	# Virst point returned by get_simple_path is always the start point, which we do not need to move to
	points.remove(0)
	
	get_parent().set_path(Array(points))
	
	
	
func exit():
	pass
	
func state_update(delta):
	countdown -= delta
	
	if countdown <= 0:
		get_parent().change_state(get_parent().get_node("walker_persue_state"))
	
	if get_parent().points_left() == 0:
		get_parent().change_state(get_parent().get_node("walker_idle_state"))
	
	

