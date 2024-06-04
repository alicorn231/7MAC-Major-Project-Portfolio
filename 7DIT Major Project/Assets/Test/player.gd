extends CharacterBody2D

@onready var animation = $AnimationPlayer

const SPEED = 130.0
const JUMP_VELOCITY = -200.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func die():
	#animation.play("die")
	get_tree().reload_current_scene()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("space"):
		animation.play("die")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		animation.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	#
	#if velocity.x == 0:
		#animation.play("idle")
	move_and_slide()

	
