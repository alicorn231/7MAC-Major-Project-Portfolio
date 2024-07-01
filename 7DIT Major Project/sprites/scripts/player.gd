extends CharacterBody2D
#CONNECT
@onready var animation = $AnimationPlayer
#@onready var gos = $UILayer/you_died_screen
@onready var coins_collected = 0
@onready var you_died_screen = $you_died
signal killed

const SPEED = 150.0
const JUMP_VELOCITY = -300.0

func _ready():
	$you_died_screen.hide()

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
			velocity.y = JUMP_VELOCITY
		
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
	is_dead = true
	animation.play("die")
	await get_tree().create_timer(2).timeout
	
func show_death_screen():
	you_died_screen.visible = true
	
func _coin_collected():
	coins_collected += 1

func at_finish():
	if coins_collected >= 1:
		get_tree().change_scene_to_file("res://sprites/screans/you_won_screen.tscn")
		if "level_1" not in LevelUnlocked.level and LevelUnlocked.current_level == "turtorial":
			LevelUnlocked.level.append("level_1")
		elif "level_2" not in LevelUnlocked.level and LevelUnlocked.current_level == "Level_1":
			LevelUnlocked.level.append("level_2") 
		elif "level_3" not in LevelUnlocked.level and LevelUnlocked.current_level == "Level_2":
			LevelUnlocked.level.append("level_3") 
		
		
func respawn():
	you_died_screen.visible = false
	get_tree().reload_current_scene()
