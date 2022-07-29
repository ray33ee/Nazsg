extends Resource

class_name DropMutex

export (float) var drop_chance

export (Array, Resource) var mutex_drops

# The Drop mutex contains a list of drops (as drop_entry) and will pick exactly one to drop, if the overall drop_chance roll succeeds.
# ASsert sum of all the drop chances within the mutex_drops list must be exactly 1


# Choose random (weighted) item in array, and call drop(node) on it
func drop_items(node):
	var roll = randf()
	
	var total = 0
	
	for item in mutex_drops:
		total += item.drop_chance
		if total >= roll:
			item.drop_items(node)
			break
