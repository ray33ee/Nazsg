extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func idle():
	linear_velocity = Vector2(0,0)

func move_to(point):
	var direction = (point - position).normalized()
	linear_velocity = direction * 10
	
func there_yet(point):
	return position.distance_to(point) < 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
