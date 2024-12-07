##击打组件
class_name HitComponent
extends Area2D

@onready var player: Player = $".."

@export var current_tool :DataTypes.Tools=DataTypes.Tools.None ##当前手持工具
@export var hit_damage:int =1 ##击打伤害

func _ready() -> void:
	current_tool=player.current_tool
