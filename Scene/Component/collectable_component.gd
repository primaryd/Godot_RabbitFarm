class_name CollectableComponent
extends Area2D
@export var collectable_name:String

var can_pick:bool = false #设置是否可以拾取

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and can_pick:
		get_parent().queue_free()
	 

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		can_pick=true



func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		can_pick = false
