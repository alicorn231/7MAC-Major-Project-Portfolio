extends Area2D

@onready var animation = $AnimationPlayer
@onready var coins_collected = 0

func _physics_process(_delta):
	animation.play("coin_spin")

func _on_body_entered(body):
	print("yo")
	if body.name != "TileMap":
		print("WEE")
		body._coin_collected()
	queue_free()
