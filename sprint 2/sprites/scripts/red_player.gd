extends CharacterBody2D

#signal player_dead

const SPEED = 50.0
const JUMP_VELOCITY = -400.0
@onready var Direction = "left"
@onready var direction = -1
@onready var animation = $AnimationPlayer
@onready var player_dead = false



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	var left_right = ["left", "right"]
	var random_index = randi() % left_right.size()
	Direction = left_right[random_index]
	


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#if direction == "left":
	#print(Input.get_axis("ui_left", "ui_right"))
	if Direction == "left":
		animation.play("walk left")
		direction = -1
	
	if Direction == "right":
		direction = 1
	
		
	#var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()



#func _on_collision_shape_side_tree_entered():
	##if 




func _on_side_body_entered(body):
	#print(body.name)
	if player_dead == false:
		if body.name == "TileMap" or body.name == "red_enemy" or body.name == "red_enemy2" or body.name == "red_enemy3" or body.name == "red_enemy4":
			if Direction == "left":
				Direction = "right"
				animation.play("walk right")
			else:
				Direction = "left"
				animation.play("walk left")
		elif body.name != "red_enemy" and body.name != "red_enemy2" and body.name != "red_enemy3" and body.name != "red_enemy4":
			print("BLAH")
			body.die()
			await get_tree().create_timer(0.4).timeout
			body.show_death_screen()
			#await get_tree().create_timer(6).timeout
			#player_dead.emit()
		

func _on_top_body_entered(body):

	if body.name != "TileMap" and body.name != "red_enemy"  and body.name != "red_enemy2" and body.name != "red_enemy3" and body.name != "red_enemy4":
		player_dead = true
		print("BLOOD")
		direction = 0
		animation.play("die")
		print("death")
		await get_tree().create_timer(0.4).timeout
		queue_free()
	pass # Replace with function body.
