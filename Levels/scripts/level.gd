extends Node2D

#creating variables
@onready var coins_collected = 0
@onready var pink = $pink_player
@onready var yellow = $yellow_player
@onready var blue = $blue_player
@onready var orange = $orange_player
@onready var green = $green_player
@onready var purple = $purple_player
@onready var level_5 = false
@onready var level_4 = false

func _ready():
	#this test to see if the current level is level 4 or 5. The variables
	#made here will be used later. 
	if LevelUnlocked.current_level == "level_5":
		level_5 = true
	if LevelUnlocked.current_level == "level_4":
		level_4 = true
	if LevelUnlocked.current_level == "turtorial":
		var get_out = get_node("get out")
		if get_out:
			get_out.hide()
	
	#this deletes all of the other collours from a scene
	#if they are not the selected colour
	if ChoosenPlayer.colour == "green":
		pink.queue_free()
		yellow.queue_free()
		blue.queue_free()
		orange.queue_free()
		purple.queue_free()
		if level_5:
			green.show_light()
	
	if ChoosenPlayer.colour == "purple":
		pink.queue_free()
		yellow.queue_free()
		blue.queue_free()
		orange.queue_free()
		green.queue_free()
		if level_5:
			purple.show_light()
		
	if ChoosenPlayer.colour == "pink":
		yellow.queue_free()
		blue.queue_free()
		orange.queue_free()
		green.queue_free()
		purple.queue_free()
		if level_5:
			pink.show_light()
		
	
	if ChoosenPlayer.colour == "yellow":
		pink.queue_free()
		blue.queue_free()
		orange.queue_free()
		green.queue_free()
		purple.queue_free()
		if level_5:
			yellow.show_light()
	
	if ChoosenPlayer.colour == "blue":
		pink.queue_free()
		yellow.queue_free()
		orange.queue_free()
		green.queue_free()
		purple.queue_free()
		if level_5:
			blue.show_light()
		
	if ChoosenPlayer.colour == "orange":
		pink.queue_free()
		yellow.queue_free()
		blue.queue_free()
		green.queue_free()
		purple.queue_free()
		if level_5:
			orange.show_light()


#This shows the "get out' text in the turtorial level
func _on_coin_1_coin_collected():
	var get_out = get_node("get out")
	get_out.show()
