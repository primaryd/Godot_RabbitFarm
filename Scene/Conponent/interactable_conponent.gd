class_name InteractableConponent
extends Area2D

signal interactable_actived
signal interactable_deactived



func _on_body_entered(body: Node2D) -> void:
	interactable_actived.emit()



func _on_body_exited(body: Node2D) -> void:
	interactable_deactived.emit()
