extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# States must define the following functions:
#	- enter(): Called when a state is loaded
#	- exit(): Called on the old state when a new state is loaded
#	- state_update(): Called in _process function of ai node
#
# States should be child nodes of the AI object
# Of all the child states within an AI object, EXACTLY ONE state must have the is_init property set to true
#
# The parent of the AI node must define the following functions:
#	- move_to(): Instructs the parent to move to a specific point
#	- idle(): Instructs the parent that there are no points to move to
#	- there_yet(): Returns true if the parent has arrived at the specified point
#
# Figure out how best to change animations based on the current state


var _path = []
var _state = null

func change_state(state):
	state.exit()
	_state = state
	_state.enter()
	
func fsm_update(delta):
	_state.state_update(delta)

# Called when the node enters the scene tree for the first time.
func _ready():
	var count = 0
	for state in get_children():
		if state.is_init:
			count += 1
			_state = state
			_state.enter()
			
	# If _path is empty at this stage (i.e. the initial state has not created a path) call idle on the parent
	if _path.size() == 0:
		get_parent().idle()
	
	assert(count == 1, "AI must contain EXACTLY one state with is_init set to true")

# Called by states to set the path that the parent object moves through
func set_path(path):
	_path = path
	
	if _path.size() == 0:
		get_parent().idle()
	else:
		get_parent().move_to(_path[0])

func clear_path():
	_path.clear()
	get_parent().idle()
	
func points_left():
	return _path.size()

# Either add a point to the end, insert a point, or append a list of points. I haven't figured out what 
# specifically this function will do yet
func add_or_insert_point_or_points(point):
	_path.push_back(point)
	
	

func _process(delta):
	if _path.size() != 0:
		if get_parent().there_yet(_path[0]): # Are we there yet?
			_path.remove(0)
			
		# If there are still points to go to, go to the next point. Otherwise call idle on parent
		if _path.size() != 0:
			get_parent().move_to(_path[0])
		else:
			get_parent().idle()
		
		
			
	fsm_update(delta)
	
	
	
