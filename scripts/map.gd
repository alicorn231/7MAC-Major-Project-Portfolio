extends Node2D

#creating variables/connecting to nodes
@onready var level_1 = $level_1
@onready var level_2 = $level_2
@onready var level_3 = $level_3
@onready var level_4 = $level_4
@onready var level_5 = $level_5
@onready var place_holder1 = $"place holder1"
@onready var place_holder2 = $"place holder2"
@onready var place_holder3 = $"place holder3"
@onready var place_holder4 = $"place holder4"
@onready var place_holder5 = $"place holder5"
@onready var click_sound = preload('res://Assets/folley effects/mixkit-video-game-retro-click-237.mp3')
@onready var admin_button_pressed = false

#removes button cover if level is unlocked.
func _ready():
	if "level_1" in LevelUnlocked.level:
		place_holder1.queue_free()
	if "level_2" in LevelUnlocked.level:
		place_holder2.queue_free()
	if "level_3" in LevelUnlocked.level:
		place_holder3.queue_free()
	if "level_4" in LevelUnlocked.level:
		place_holder4.queue_free()
	if "level_5" in LevelUnlocked.level:
		place_holder5.queue_free()
	pass # Replace with function body.


# does nothing
func _process(_delta):
	pass

# these function all change the scene the level based on what button is pressed
func _on_level_5_pressed():
	BackgroundMusic.play_FX(click_sound)
	LevelUnlocked.current_level = "level_5"
	get_tree().change_scene_to_file("res://Levels/tscn/level_5.tscn")
	
func _on_level_4_pressed():
	BackgroundMusic.play_FX(click_sound)
	LevelUnlocked.current_level = "level_4"
	get_tree().change_scene_to_file("res://Levels/tscn/level_4.tscn")

func _on_level_3_pressed():
	BackgroundMusic.play_FX(click_sound)
	LevelUnlocked.current_level = "level_3"
	get_tree().change_scene_to_file("res://Levels/tscn/level_3.tscn")

func _on_level_2_pressed():
	BackgroundMusic.play_FX(click_sound)
	LevelUnlocked.current_level = "level_2"
	get_tree().change_scene_to_file("res://Levels/tscn/level_2.tscn")


func _on_level_1_pressed():
	BackgroundMusic.play_FX(click_sound)
	LevelUnlocked.current_level = "level_1"
	get_tree().change_scene_to_file("res://Levels/tscn/level_1.tscn")


func _on_tutorial_pressed():
	BackgroundMusic.play_FX(click_sound)
	LevelUnlocked.current_level = "turtorial"
	get_tree().change_scene_to_file("res://Levels/tscn/turtorial.tscn")


func _on_back_pressed():
	BackgroundMusic.play_FX(click_sound)
	get_tree().change_scene_to_file("res://sprites/screans/home_screan.tscn")

#When the admin button is pressed, all levels are unlocked
func _on_admin_button_pressed():
	if not admin_button_pressed:
		if "level_1" not in LevelUnlocked.level:
			place_holder1.queue_free()
		if "level_2" not in LevelUnlocked.level:
			place_holder2.queue_free()
		if "level_3" not in LevelUnlocked.level:
			place_holder3.queue_free()
		if "level_4" not in LevelUnlocked.level:
			place_holder4.queue_free()
		if "level_5" not in LevelUnlocked.level:
			place_holder5.queue_free()
		LevelUnlocked.level = ["tutorial", "level_1", "level_2", "level_3", "level_4", "level_5"]
		
		admin_button_pressed = true
