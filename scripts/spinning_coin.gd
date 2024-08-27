extends Area2D

signal coin_collected

@onready var animation = $AnimationPlayer
@onready var coins_collected = 0
@onready var coin_sound = preload("res://Assets/folley effects/mixkit-winning-a-coin-video-game-2069.mp3")
	

func _physics_process(_delta):
	#plays coin animation
	animation.play("coin_spin")

func _on_body_entered(body):
	#when coin touched, play sound effect, dissapaear, 
	#emit signal "coin_collected"
	BackgroundMusic.play_FX(coin_sound)
	if body.name != "TileMap":
		body._coin_collected()
		emit_signal("coin_collected")
		queue_free()
		
