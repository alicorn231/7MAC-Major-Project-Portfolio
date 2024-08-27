extends Area2D

signal coin_collected

@onready var animation = $AnimationPlayer
@onready var coins_collected = 0

	

func _physics_process(_delta):
	animation.play("coin_spin")

func _on_body_entered(body):
	if body.name != "TileMap":
		body._coin_collected()
		#coins_collected.emit
		emit_signal("coin_collected")
		queue_free()
		
