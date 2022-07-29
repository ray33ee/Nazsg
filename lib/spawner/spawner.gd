extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(Resource) var entity = null

func spawn(quantity):
	var grandad = get_parent().get_parent()
	var spawner_position = get_parent().position
	
	for i in quantity:
		var e = entity.instance()
		
		e.position = spawner_position
		
		grandad.add_child(e)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
