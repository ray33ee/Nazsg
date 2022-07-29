extends TileMap


# Map pseudo randomly generates terrain from a seed

var delay = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
