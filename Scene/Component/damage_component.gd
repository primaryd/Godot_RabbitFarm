##伤害管理组件
class_name  DamageComponent
extends Node2D

@export var max_damage = 1
@export var current_damage = 0

signal max_damage_reached #达到最大伤害值

func apply_damagge(damage:int)->void:
	#将伤害值控制在 0 到 max_damage 之间
	current_damage = clamp(current_damage+damage,0,max_damage)
	
	#如果伤害到达最高值
	if current_damage ==max_damage:
		max_damage_reached.emit()
