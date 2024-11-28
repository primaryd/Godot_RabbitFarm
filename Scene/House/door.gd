extends StaticBody2D

@onready var interactable_conponent: InteractableConponent = $InteractableConponent
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	interactable_conponent.interactable_actived.connect(on_interactable_actived)
	interactable_conponent.interactable_deactived.connect(on_interactable_deactived)
	collision_layer=1
#.......................................
#玩家的碰撞层在2，并且与碰撞层1有碰撞。
#所以只需要在开门的时候更改door的碰撞层为2。
#这个时候玩家就于门没有物理碰撞关系了。
#........................................


func on_interactable_actived()->void:
	animated_sprite_2d.play("open_door")
	await  get_tree().create_timer(0.3).timeout
	print("open_door")
	collision_layer=2  # 通过更改碰撞层来让玩家通过

func on_interactable_deactived()->void:
	animated_sprite_2d.play("close_door")
	await  get_tree().create_timer(0.1).timeout
	collision_layer=1
