extends Node2D

@onready var level_1 = $level_1
@onready var level_2 = $level_2
@onready var level_3 = $level_3
@onready var place_holder1 = $"place holder1"
@onready var place_holder2 = $"place holder2"
@onready var place_holder3 = $"place holder3"


# Called when the node enters the scene tree for the first time.
func _ready():
	#LevelUnlocked.level = ["turtorial"]
	print(LevelUnlocked.level)
	if "level_1" not in LevelUnlocked.level:
		level_1.queue_free()
	if "level_2" not in LevelUnlocked.level:
		level_2.queue_free()
	if "level_2" not in LevelUnlocked.level:
		level_3.queue_free()
	if "level_1" in LevelUnlocked.level:
		place_holder1.queue_free()
	if "level_2" in LevelUnlocked.level:
		place_holder2.queue_free()
	if "level_3" in LevelUnlocked.level:
		place_holder3.queue_free()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _on_level_3_pressed():
	LevelUnlocked.current_level = "level_3"
	get_tree().change_scene_to_file("res://Levels/tscn/level_3.tscn")
	#var you_died_screan = get_node("you_died_screan")
	#you_died_screan.set_level("res://Levels/tscn/level_3.tscn")


func _on_level_2_pressed():
	LevelUnlocked.current_level = "level_2"
	get_tree().change_scene_to_file("res://Levels/tscn/level_2.tscn")


func _on_level_1_pressed():
	LevelUnlocked.current_level = "level_1"
	get_tree().change_scene_to_file("res://Levels/tscn/level_1.tscn")


func _on_tutorial_pressed():
	LevelUnlocked.current_level = "turtorial"
	get_tree().change_scene_to_file("res://Levels/tscn/turtorial.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://sprites/screans/home_screan.tscn")
