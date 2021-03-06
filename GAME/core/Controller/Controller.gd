
extends Node

#	INPUT CONTROLLER NODE
#
#	Transfers player input into commands
#	to a game ship.



# Game node
onready var game = get_node('/root/Game')

# List of current Actions used by Controller.
#	(update this as new actions are added)
var cmd_state = {
'thrust_pro':	false,
'thrust_retro':	false,
'rcs_pro':		false,
'rcs_retro':	false,
'rcs_left':		false,
'rcs_right':	false,
'yaw_left':		false,
'yaw_right':	false,
'dock':			false,
'undock':		false,
}

#	The thing this Controller is controlling
var controlled





#####################
#	PUBLIC METHODS	#

# Turn controls on
func enable():
	set_fixed_process(true)

# Turn controls off
func disable():
	set_fixed_process(false)

# Get control enabled state
func get_enabled():
	return is_fixed_processing()

# Plug into an object
func plug_in(obj):
	obj.controller = self
	controlled = obj
	obj.focus_camera()

# Unplug from controlled object
func unplug():
	controlled.controller = null
	controlled = null






#########################
#	PRIVATE METHODS		#

# Init
func _ready():
	set_fixed_process(true)

#	CONTROL PROCESS LOOP
func _fixed_process(delta):
	# Construct cmdState dict
	for act in cmd_state:
		if cmd_state[act]:
			cmd_state[act] = false
		if Input.is_action_pressed(act):
			cmd_state[act] = true



