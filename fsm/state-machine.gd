extends Node

class_name StateMachine

signal stateTransition(from: String, to: String)

@export var _initial_state : NodePath
@export var _target_node : Node

var _states : Dictionary

var curr_state : State
var push_down = []

func _ready():
	if (!_target_node):
		_target_node = get_parent()
	
	for s in get_children():
		_init_state(s)

	if (len(get_children()) > 0):
		transition_to(_initial_state)

func add_state(state: State):
	_init_state(state)

func transition_to(state_name : String):
	var next_state = _states[state_name]
	
	if (next_state == null):
		print("Can't transition to non-existent state: ", state_name)
		return
		
	_transition_to(next_state)

func exit_state(state: State):
	if (state != curr_state):
		print ("Can't exit state which isn't current. (", state,")")
		return
	
	var previous_state = push_down.pop_back()
	
	if (previous_state):
		_transition_to(previous_state)
	else:
		transition_to(_initial_state)
		
func _transition_to(next_state : State):
	var prev_state_name = null
	
	if (curr_state != null):
		push_down.push_back(curr_state)
		if ("exit" in curr_state):
			curr_state.exit()
		curr_state.process_mode = Node.PROCESS_MODE_DISABLED
		prev_state_name = curr_state.name
	
	curr_state = next_state
	if ("enter" in curr_state):
		curr_state.enter()
	curr_state.process_mode = Node.PROCESS_MODE_INHERIT
	
	print (_target_node.name, "transitioned from ", prev_state_name, " to ", curr_state.name)
	stateTransition.emit(prev_state_name, curr_state.name)

func _init_state(state: State):
	state.target = _target_node
	state.fsm = self
	state.process_mode = Node.PROCESS_MODE_DISABLED
	
	state.exited.connect(exit_state)
	if ("init" in state):
		state.init()
	
	_states[state.name] = state
