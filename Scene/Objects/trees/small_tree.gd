extends Sprite2D
@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent

func  _ready() -> void:
	hurt_component.hurt.connect(_on_hurt)
	damage_component.max_damage_reached.connect(_max_damage_reached)

func _on_hurt(hit_damage:int)->void:
	print("Hurt")
	damage_component.apply_damagge(hit_damage)

func _max_damage_reached()->void:
	
	print(name+"Reached the max damage\n")
	queue_free()
