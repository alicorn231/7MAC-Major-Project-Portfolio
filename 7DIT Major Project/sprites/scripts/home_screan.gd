extends Control


@onready var colour = "purple"
@onready var level = ["turtorial"]
@onready var current_level = "turtorial"

#@onready var animation = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass



func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://sprites/screans/map.tscn")


func _on_colour_pressed():
	get_tree().change_scene_to_file("res://sprites/screans/choose_your_player.tscn")
	pass # Replace with function body.
