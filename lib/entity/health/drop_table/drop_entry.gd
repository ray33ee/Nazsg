extends Resource

class_name DropEntry

export(PackedScene) var item = null
export(int) var minimum_drop
export(int) var maximum_drop

export(float) var drop_chance

# Choose a random number of items between minimum_drop and maximum_drop, then
# drop that number of instantieted items, using node as the parent
func drop_items(entity):
	var drop_count = minimum_drop + randi() % (maximum_drop - minimum_drop + 1)
	
	print("Instantiate " + String(drop_count) + " instances of class '" +  "'")
	
	# First parent is health node, second parent is entity, third parent is the world
	var world = entity.get_parent()
	
	for i in drop_count:
		# Instantiate new item
		#var instance = item.instance()
		
		# Set parent (to the world)
		#world.add_child(instance)
		
		# Move object to position#
		#instance.position = entity.position
		
		pass
