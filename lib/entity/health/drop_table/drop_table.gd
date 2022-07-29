extends Node2D

# Node representing a drop table, containing packed scenes (i.e. the drops themselves) and their drop weights

# At first this table should be a simple list of (packed scene, weight [as percentage]) pairs, but this should be expanded
# to allow mutually exclusive drops. Do this by letting each element be either a (packed scene, weight) pair OR a 
# list of pairs itself.
export(Resource) var table = null

# What should we send as the node??? get_parent().get_parent().get_parent()????
func drop_items():
	if randf() <= table.drop_chance:
		table.drop_items(get_parent().get_parent())

# Called when the node enters the scene tree for the first time.
func _ready():
	if table == null:
		print("ERROR: Drop table node MUST contain a drop table resource (either DropEntry, DropList, or DropMutex)")
	
	if table.drop_chance != 1:
		print("WARNING: Root table is not guaranteed to drop (as drop chance is not 1). Is this intentional?")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
