extends CharacterBody2D

#creating varibales
@onready var animation = $AnimationPlayer
@onready var coins_collected = 0
@onready var you_died_screen = $you_died
@onready var jump_sound = preload("res://Assets/folley effects/arcade-game-jump-epic-stock-media-1-00-00.mp3")
@onready var squish_sound = preload("res://Assets/folley effects/mixkit-video-game-blood-pop-2361.mp3")
@onready var death_screen_sound = preload("res://Assets/folley effects/mixkit-arcade-space-shooter-dead-notification-272.mp3")
@onready var complete_sound = preload("res://Assets/folley effects/mixkit-bonus-earned-in-video-game-2058.mp3")
@onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var is_dead = false
const SPEED = 150.0
const JUMP_VELOCITY = -300.0


func _ready():
	#when the progarm starts, death scren is hiden, 
	#darkness is removed
	$you_died_screen.hide()
	var light = get_node("PointLight2D")
	light.hide()
	var module = get_node("CanvasModulate")
	module.hide()

func _physics_process(delta):
	#jumping mechanics
	if not is_on_floor():
		velocity.y += gravity * delta
	
	#If player is not dead, let player move
	if is_dead == false:
		# Handle jump.
		if Input.is_action_just_pressed("move_up") and is_on_floor():
			BackgroundMusic.play_FX(jump_sound)
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

func reset_scene():
	#restes scene
	get_tree().change_scene_to_file("res://sprites/screans/you_won_screen.tscn")

func die():
	#makes player die, plays sound effect
	is_dead = true
	animation.play("die")
	BackgroundMusic.play_FX(squish_sound)
	await get_tree().create_timer(0.4).timeout
	
func show_death_screen():
	#shows the death screan with sound effect
	BackgroundMusic.play_FX(death_screen_sound)
	you_died_screen.visible = true

func _coin_collected():
	#adds 1 to "coins_collected" varibale
	coins_collected += 1

func at_finish():
	#if the coin is collected, play sound effect
	#unlock next level ensureing that it unlocks the right level
	if coins_collected >= 1:
		BackgroundMusic.play_FX(complete_sound)
		reset_scene()
		var levels = ["turtorial", "level_1", "level_2", "level_3", "level_4", "level_5"]
		var current_index = levels.find(LevelUnlocked.current_level)
		
		if current_index >= 0 and current_index < levels.size() - 1:
			var next_level = levels[current_index + 1]
			if next_level not in LevelUnlocked.level:
				LevelUnlocked.level.append(next_level)

func respawn():
	#hides death screen, reloads current scene
	you_died_screen.visible = false
	get_tree().reload_current_scene()

func show_light():
	#makes scene dark, adds pointlight2D
	var light = get_node("PointLight2D")
	light.show()
	var module = get_node("CanvasModulate")
	module.show()

func hide_light():
	#removes ligth/,akles scene bright
	var light = get_node("PointLight2D")
	light.hide()
	var module = get_node("CanvasModulate")
	module.hide()
	
	
