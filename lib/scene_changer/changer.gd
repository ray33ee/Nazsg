extends Node2D

# This node must be a child of the root node to work.

# Changer node must be placed as the child of the main scene, and must be unique. It can be used to:
# - Change scenes
# - Send parameters to changed scenes
# - Store global data that is always available. Data can be stored in:
#   - The data dictionary
#   - Child nodes of the changer itself

export (Dictionary) var data = null

func change_scene(node, params=null):
	 
	# Before we get to work, we must store a few references
	var parent = get_parent()	
	var root = get_tree().get_root()
	
	# Remove self from the current scene
	get_parent().remove_child(self)
	
	# Mark the current scene for deletion
	parent.queue_free()
	
	# Move the new scene into the root
	root.add_child(node)
	
	# Move this changer into the new scene
	node.add_child(self)
	
	# Send params to the node if it has an init function to take them
	if "init" in node:
		node.init(params)
	

