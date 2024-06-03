extends CharacterBody2D
#CONNECT
@onready var animation = $AnimationPlayer
@onready var gos = $UILayer/you_died_screen
signal killed

const SPEED = 130.0
const JUMP_VELOCITY = -200.0



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var is_dead = false
#func die():
	#animation.play("die")
	#get_tree().reload_current_scene()

func _physics_process(delta):
	#if is_dead == false:
		#gos.visible = true 
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	#If player is not dead, let player move
	if is_dead == false:
		# Handle jump.
		if Input.is_action_just_pressed("move_up") and is_on_floor():
			print(velocity.y)
			velocity.y = JUMP_VELOCITY
			print(velocity.y)
		
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("move_left", "move_right")
		if direction and is_dead == false:
			velocity.x = direction * SPEED
			if velocity.x <= -1:
				animation.play("walk left")
			if direction >= 1:
				animation.play("walk right")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		# if player is station play idle animation
		if velocity.x == 0:
			animation.play("idle")
		move_and_slide()

func die():
	#print("hi")
	#animation.play("die")
	#await get_tree().create_timer(0.5).timeout
	is_dead = true
	#killed.emit()
	animation.play("die")
	await get_tree().create_timer(1.5).timeout
	#gos.visible = true 
	print("bye")
