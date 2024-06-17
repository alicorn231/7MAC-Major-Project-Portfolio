extends Node2D

@onready var coins_collected = 0

#@onready var gos = $UILayer/GameOverScrean
#var player = null
#@export var level_start_pos: Node2D
#spawn point
## Called when the node enters the scene tree for the first time.
func _ready():
	print(coins_collected)
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
	#
#func _on_player_killed():
	#get_tree().change_scene("res://sprites/you_died_screen.tscn")
