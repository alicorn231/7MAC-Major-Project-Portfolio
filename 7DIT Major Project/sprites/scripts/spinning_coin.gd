extends Area2D

@onready var animation = $AnimationPlayer
@onready var coins_collected = 0

func _physics_process(delta):
	animation.play("coin_spin")

func _on_body_entered(body):
	body._coin_collected()
	queue_free()
	print("from spinning coin tsc you have collected", coins_collected)
	
	#if body.has_method("collect coin")
		#body.collect_coin()
