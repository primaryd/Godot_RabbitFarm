##受击组件
class_name HurtComponent
extends Area2D

@export var tool:DataTypes.Tools=DataTypes.Tools.None

signal hurt




func _on_area_entered(area: Area2D) -> void:
	#当有 hit组件进入hurt组件时，获取hit组件
	var hit_component := area as HitComponent
	
	#如果hurt组件与hit组件的tool对于，就触发on_hurt信号(发送击打伤害)
	if tool == hit_component.current_tool:
		hurt.emit(hit_component.hit_damage)
