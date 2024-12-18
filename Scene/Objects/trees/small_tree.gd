extends Sprite2D
@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent

var log_scene := preload("res://Scene/Objects/Log/log.tscn")

func  _ready() -> void:
	hurt_component.hurt.connect(_on_hurt)
	damage_component.max_damage_reached.connect(_max_damage_reached)

func _on_hurt(hit_damage:int)->void:
	print("Hurt")
	damage_component.apply_damagge(hit_damage)

func _max_damage_reached()->void:
	call_deferred("add_log_scene")  #延时执行，如果这里直接在queue_free（）之后使用add_log_scene() 会直接报错，因为节点已经被释放了。
	print(name+"Reached the max damage\n")
	queue_free()

func add_log_scene()->void:
	var log_instance = log_scene.instantiate() as Node2D #实例化节点
	log_instance.global_position=global_position  #修改节点位置
	get_parent().add_child(log_instance) #添加节点到场景树
