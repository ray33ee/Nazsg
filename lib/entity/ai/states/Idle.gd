extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var is_init = false

var elapsed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func enter():
	print("Idle entered")
	
func state_update(delta):
	elapsed += delta
	
	if elapsed > 1.0:
		elapsed = 0
		get_parent().change_state(get_parent().get_node("Persue"))
	
func exit():
	print("Idle exited")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
