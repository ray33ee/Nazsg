extends Node2D

enum Wave { SINE, LINEAR }
export(Wave) var wave = null

export var frequency = 1
export var amplitude = 1

# Node that allows the child objects to look like they're floating sine wave style. 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for child in get_children():
		if "position" in child:
			pass
