extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://Levels/tscn/level_2.tscn")


func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://Levels/tscn/level_1.tscn")

func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://Levels/tscn/turtorial.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://sprites/screans/home_screan.tscn")
