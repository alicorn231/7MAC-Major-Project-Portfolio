extends CharacterBody2D
 
const SPEED = 50.0
const JUMP_VELOCITY = -400.0
@onready var Direction = "left"
@onready var direction = -1
@onready var animation = $AnimationPlayer
@onready var player_dead = false

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	var left_right = ["left", "right"]
	var random_index = randi() % left_right.size()
	Direction = left_right[random_index]

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

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
	if body.name not in ["TileMap", "red_enemy", "red_enemy2", "red_enemy3", "red_enemy4"]:
		print("top")
		player_dead = true
		direction = 0
		animation.play("die")
		await get_tree().create_timer(0.4).timeout
		queue_free()


func _on_bottom_body_entered(body):
	if not player_dead:
		if body.name in ["TileMap", "red_enemy", "red_enemy2", "red_enemy3", "red_enemy4"]:
			if Direction == "left":
				Direction = "right"
				animation.play("walk right")
			else:
				Direction = "left"
				animation.play("walk left")
		elif not body.name in ["red_enemy", "red_enemy2", "red_enemy3", "red_enemy4"]:
			print("side")
			body.die()
			await get_tree().create_timer(0.4).timeout
			body.show_death_screen()
