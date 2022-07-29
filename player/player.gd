extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var packed_projectile = preload("res://generic_projectile//generic_projectile.tscn")

func _physics_process(delta):
	$directional_movement.calculate_movement()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("attack"):
		
		var direction = get_global_mouse_position() - position
		
		var pro = packed_projectile.instance()
		
		#get_parent().add_child(pro)
		
		pro.position = position
		
		pro.linear_velocity = direction * 10
		
		$damager.attack()
		
		#for child in get_children():
		#	if child.has_method("attack"):
		#		child.attack()
			
