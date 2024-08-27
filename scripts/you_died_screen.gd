extends Control

#creation varbiables
@onready var click_sound = preload('res://Assets/folley effects/mixkit-video-game-retro-click-237.mp3')
@onready var level_5 = false

func _ready():
	#if level 5, show light
	if LevelUnlocked.current_level == "level_5":
		var light = get_node("PointLight2D")
		light.show()

func _process(_delta):
	#when space pressed, reset scene
	if Input.is_action_just_pressed("space"):
		var player = get_parent()
		player.respawn() 
		


func _on_give_up_pressed():
	#play sound effect, return to map scene
	BackgroundMusic.play_FX(click_sound)
	get_tree().change_scene_to_file("res://sprites/screans/map.tscn")



func _on_restart_button_pressed():
	#play sound effect, reset scene
	BackgroundMusic.play_FX(click_sound)
	var player = get_parent()
	player.respawn()
	
	

	
