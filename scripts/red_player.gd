extends CharacterBody2D
 
#creat varibales
const SPEED = 50.0
const JUMP_VELOCITY = -400.0
@onready var Direction = "left"
@onready var direction = -1
@onready var animation = $AnimationPlayer
@onready var player_dead = false
@onready var squish_sound = preload("res://Assets/folley effects/mixkit-video-game-blood-pop-2361.mp3")
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	#on ready chooses dirrectiion left or right randomly
	var left_right = ["left", "right"]
	var random_index = randi() % left_right.size()
	Direction = left_right[random_index]

func _physics_process(delta):
	#adds gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	
	#handles walking with animation
	if not player_dead:
		if Direction == "left":
			animation.play("walk left")
			direction = -1
		elif Direction == "right":
			animation.play("walk right")
			direction = 1

		velocity.x = direction * SPEED

		move_and_slide()

func _on_top_body_entered(body):
	#when jumped on die wiht sound effect
	if body.name not in ["TileMap", "red_enemy", "red_enemy2", "red_enemy3", "red_enemy4", "red_enemy5",  "red_enemy6",  "red_enemy7",  "red_enemy8"]:
		player_dead = true
		direction = 0
		BackgroundMusic.play_FX(squish_sound)
		animation.play("die")
		await get_tree().create_timer(0.4).timeout
		queue_free()


func _on_bottom_body_entered(body):
	#when side hit, if hit by another enmy or tile map,
	#change dircetion, if hit by player, kill player.
	if not player_dead:
		if body.name in ["TileMap", "red_enemy", "red_enemy2", "red_enemy3", "red_enemy4", "red_enemy5",  "red_enemy6",  "red_enemy7",  "red_enemy8"]:
			if Direction == "left":
				Direction = "right"
				animation.play("walk right")
			else:
				Direction = "left"
				animation.play("walk left")
		elif not body.name in ["TileMap", "red_enemy", "red_enemy2", "red_enemy3", "red_enemy4", "red_enemy5",  "red_enemy6",  "red_enemy7",  "red_enemy8"]:
			body.die()
			await get_tree().create_timer(0.4).timeout
			body.show_death_screen()
