extends Control


@onready var colour = "purple"
@onready var level = ["turtorial"]
@onready var current_level = "turtorial"
@onready var click_sound = preload('res://Assets/folley effects/mixkit-video-game-retro-click-237.mp3')


#@onready var animation = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	BackgroundMusic.play_music_level()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass



func _on_start_button_pressed():
	BackgroundMusic.play_FX(click_sound)
	get_tree().change_scene_to_file("res://sprites/screans/map.tscn")


func _on_colour_pressed():
	BackgroundMusic.play_FX(click_sound)
	get_tree().change_scene_to_file("res://sprites/screans/choose_your_player.tscn")
	pass # Replace with function body.


