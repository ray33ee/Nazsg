extends Resource

class_name DropList

export (Array, Resource) var list

export(float) var drop_chance

# Make a roll against each item in the table (i.e. generate a random number, if number is less 
# than table[i].drop_chance, roll has succeeded) if it succeds call drop()
func drop_items(node):
	for item in list:
		if randf() < item.drop_chance:
			item.drop_items(node)
