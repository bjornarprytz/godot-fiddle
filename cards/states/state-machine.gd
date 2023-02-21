extends Node

class_name StateMachine

@export var _initial_state : NodePath
@export var _card : Card

var _states : Dictionary

var state : State
var push_down = []

func _ready():
	_card = get_parent()
	
	for s in get_children():
		s.card = _card
		s.fsm = self
		s.process_mode = Node.PROCESS_MODE_DISABLED
		_states[s.name] = s

	if (len(get_children()) > 0):
		transition_to(_initial_state)

func transition_to(state_name : String):
	var next_state = _states[state_name]
	
	if (next_state == null):
		print("Can't transition to non-existent state: ", state_name)
		return
		
	_transition_to(next_state)

func exit_state():
	var previous_state = push_down.pop_back()
	
	if (previous_state):
		_transition_to(previous_state)
	else:
		transition_to(_initial_state)
		
func _transition_to(next_state : State):
	if (state != null):
		push_down.push_back(state)
		if ("exit" in state):
			state.exit()
		state.process_mode = Node.PROCESS_MODE_DISABLED
	
	state = next_state
	if ("enter" in state):
		state.enter()
	state.process_mode = Node.PROCESS_MODE_INHERIT

