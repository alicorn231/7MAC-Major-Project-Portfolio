extends Node2D

@onready var coins_collected = 0
@onready var pink = $pink_player
@onready var yellow = $yellow_player
@onready var blue = $blue_player
@onready var orange = $orange_player
@onready var green = $green_player
@onready var purple = $purple_player

#@onready var gos = $UILayer/GameOverScrean
#var player = null
#@export var level_start_pos: Node2D
#spawn point
## Called when the node enters the scene tree for the first time.
func _ready():
	if ChoosenPlayer.colour == "green":
		pink.queue_free()
		yellow.queue_free()
		blue.queue_free()
		orange.queue_free()
		purple.queue_free()
	
	if ChoosenPlayer.colour == "purple":
		pink.queue_free()
		yellow.queue_free()
		blue.queue_free()
		orange.queue_free()
		green.queue_free()
		
	if ChoosenPlayer.colour == "pink":
		#pink.queue_free()
		yellow.queue_free()
		blue.queue_free()
		orange.queue_free()
		green.queue_free()
		purple.queue_free()
		
	
	if ChoosenPlayer.colour == "yellow":
		pink.queue_free()
		#yellow.queue_free()
		blue.queue_free()
		orange.queue_free()
		green.queue_free()
		purple.queue_free()
	
	if ChoosenPlayer.colour == "blue":
		pink.queue_free()
		yellow.queue_free()
		#blue.queue_free()
		orange.queue_free()
		green.queue_free()
		purple.queue_free()
		
	if ChoosenPlayer.colour == "orange":
		pink.queue_free()
		yellow.queue_free()
		blue.queue_free()
		#orange.queue_free()
		green.queue_free()
		purple.queue_free()
		
		
		
	#print(ChoosenPlayer.colour)
#
#
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
	#
#func _on_player_killed():
	#get_tree().change_scene("res://sprites/you_died_screen.tscn")

#
#func _on_acid_collision_player_dead():
	#var player = get_node("/root/ChoosenPlayer")


