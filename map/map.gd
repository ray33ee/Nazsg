extends TileMap


# Map pseudo randomly generates terrain from a seed

var delay = 0

var countdown = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	countdown -= delta
	
	if countdown <= 0:
		countdown = 10
		print(get_child_count())
