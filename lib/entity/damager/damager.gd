extends Node2D

export (int) var default_damage = 10
export (Dictionary) var damage_map = {}

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func get_damage(node):
	if "type" in node:
		if node.type in damage_map:
			return damage_map[node.type]
		else:
			return default_damage
	else:
		return default_damage
		
func attack():
	# Iterate over each Area2d within damage node. 
	# For each Area2D, iterate over each overlapping area.
	# If the overlapping area is a health area, call hurt on the parent node,
	# doing damage based on the damage_lookup function
	
	# Get all children that are Area2D nodes
	for child in get_children():
		if child.has_method("get_overlapping_areas"):
			# Get all overlapping Area2D objects that have health node as a parent
			for area in child.get_overlapping_areas():
				var entity = area.get_parent().get_parent()
				try_damage(entity)
				
				
	
# Attempt to deal damage to a specific node
func try_damage(node):
	for child in node.get_children():
		if child.has_method("hurt"):
			var health = child # Get the health node of the atackee
			var attackee = node
			health.hurt(get_damage(attackee))
	

# Called when the node enters the scene tree for the first time.
func _ready():
	var area_count = 0
	
	for child in get_children():
		if child.has_method("get_overlapping_areas"):
			area_count += 1
	
	if area_count == 0:
		print("Warning: Damager node has no Area2D child.")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
