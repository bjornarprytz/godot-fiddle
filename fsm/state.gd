extends Node
class_name State

signal exited(state: State)

var fsm: StateMachine
var target: Node2D
