extends Node2D

#creating varibales
@onready var animation_rotation = $AnimationPlayer
@onready var animation_click = $AnimationPlayer2
@onready var slime_num = 0
@onready var green = 0
@onready var blue  = 1
@onready var purple = 2
@onready var orange = 3
@onready var pink = 4
@onready var yellow = 5
@onready var colours_list_number = [green, purple, blue, orange, pink, yellow]
@onready var colours_liar = ["green", "blue", "purple", "orange", "pink", "yellow"]
@onready var current_colours = "green"
@onready var Selected = $Selected
@onready var selected = (colours_liar.find(ChoosenPlayer.colour))
@onready var click_sound = preload('res://Assets/folley effects/mixkit-video-game-retro-click-237.mp3')

#this hides the "selected" text
func _ready():
	Selected.hide()

# does nothing
func _process(_delta):
	pass
	
# when the left button is pressed, sound effect is played, old player 
#is hidden, new player is rotated to, new player is shown. 
func _on_left_pressed():
	BackgroundMusic.play_FX(click_sound)
	Selected.hide()
	slime_num += 1
	if slime_num == 6:
		slime_num = 0
	for colour in range(colours_list_number.size()):
		if colour == slime_num:
			current_colours =  colours_liar[colour]
			
			animation_rotation.play(current_colours)
	animation_click.play("Click left")
	if slime_num == selected:
		Selected.show()

#does the same thing as above but backwords
func _on_right_pressed():
	BackgroundMusic.play_FX(click_sound)
	Selected.hide()
	slime_num -= 1
	if slime_num == -1:
		slime_num = 5
	for colour in range(colours_list_number.size()):
		if colour == slime_num:
			current_colours =  colours_liar[colour]
			
			animation_rotation.play(current_colours)
	animation_click.play("click right")
	if slime_num == selected:
		Selected.show()

# when the slected buton is pressed, sound effect
#is played, current player is selcted as choosen player
#selected text reveals.
func _on_select_pressed():
	BackgroundMusic.play_FX(click_sound)
	ChoosenPlayer.colour = current_colours
	print(current_colours)
	selected = colours_liar.find(current_colours)
	Selected.show()

#when back button is pressed change current scene to home screen
func _on_back_pressed():
	BackgroundMusic.play_FX(click_sound)
	get_tree().change_scene_to_file("res://sprites/screans/home_screan.tscn")
