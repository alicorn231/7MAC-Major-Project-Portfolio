extends Node2D


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

# 0 = green
#1 = yellow
#2 = blue
#3 = orange
#4 = puple
#5 = pink
# Called when the node enters the scene tree for the first time.ace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _ready():
	Selected.hide()
func _process(_delta):
	pass
	

func _on_left_pressed():
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


func _on_right_pressed():
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

func _on_select_pressed():
	ChoosenPlayer.colour = current_colours
	print(current_colours)
	selected = colours_liar.find(current_colours)
	Selected.show()


func _on_back_pressed():
	get_tree().change_scene_to_file("res://sprites/screans/home_screan.tscn")
