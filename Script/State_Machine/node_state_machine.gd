class_name NodeStateMachine
extends Node

@export var initial_node_state : NodeState

var node_states : Dictionary = {} # 一个字典用于存储状态机的全部节点
var current_node_state : NodeState #当前状态节点
var current_node_state_name : String #当前状态节点名称 
var parent_node_name: String #父节点名称 用于测试程序 说明这是哪个角色的状态机


func _ready() -> void:
	parent_node_name = get_parent().name
	
	#获取状态机节点下的所有状态，并将其存入node_states这个字典中，连接transition这个信号到transition_to这个函数
	for child in get_children():
		if child is NodeState:
			node_states[child.name.to_lower()] = child
			child.transition.connect(transition_to)
	
	#设置初始状态
	if initial_node_state:
		initial_node_state._on_enter()
		current_node_state = initial_node_state
		current_node_state_name = current_node_state.name.to_lower()


func _process(delta : float) -> void:
	if current_node_state:
		# print("Current State: ", current_node_state_name)
		current_node_state._on_process(delta)


func _physics_process(delta: float) -> void:
	if current_node_state:
		current_node_state._on_physics_process(delta)
		current_node_state._on_next_transitions()
		#print(parent_node_name, " Current State: ", current_node_state_name)

#通过emit("***")其中的字符 转化到对应的节点
func transition_to(node_state_name : String) -> void:
	# 如果状态没有发生变化直接返回
	if node_state_name == current_node_state.name.to_lower():
		return
	
	#字典里的名字获取到对应的节点
	var new_node_state = node_states.get(node_state_name.to_lower())
	
	if !new_node_state:
		return
	
	if current_node_state:
		current_node_state._on_exit()
	
	new_node_state._on_enter()
	
	current_node_state = new_node_state
	current_node_state_name = current_node_state.name.to_lower()
	#print("Current State: ", current_node_state_name)
