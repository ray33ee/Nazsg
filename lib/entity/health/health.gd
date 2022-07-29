extends Node2D


# This node handles health, max health, and uses that to call death() on the parent object
# When we call parent.death(), check for any children of health node. If any of them are a drop table, 
# invoke the death thing in the drop table

export var max_health = 100.0

export var health = 100.0

# If set to true, queue_free() is called after death() 
export var auto_kill = false

func _ready():
	var area_count = 0
	
	for child in get_children():
		if child.has_method("get_overlapping_areas"):
			area_count += 1
	
	if area_count == 0:
		print("Warning: Health node has no Area2D child.")

func hurt(damage):
	health -= damage
	
	if health <= 0.0:
		health = 0.0
		
		# If the health node contains any drop_item nodes, call drop_items on each one
		for child in get_children():
			if child.has_method("drop_items"):
				child.drop_items()
		
		# If the parent has a death function, call it
		if get_parent().has_method("death"):
			get_parent().death()
			
		# If auto_kill is enabled, destroy the object
		if auto_kill:
			get_parent().queue_free()
		
func heal(points):
	health += points
	
	if health > max_health:
		health = max_health

