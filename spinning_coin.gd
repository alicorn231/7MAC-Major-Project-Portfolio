extends Area2D

@onready var animation = $AnimationPlayer

func _physics_process(delta):
	animation.play("coin_spin")

func _on_body_entered(body):
	queue_free()
	#if body.has_method("collect coin")
		#body.collect_coin()
