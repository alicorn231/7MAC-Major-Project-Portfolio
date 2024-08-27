extends Node2D

#creating varibales
@onready var player_at_start = true

#does nothing
func _ready():
	pass # Replace with function body.


#does nothing
func _process(_delta):
	pass

#when player gets close to move keys,
#the animation is played, when player moves away,
#animation stois
func _on_area_2d_body_entered(_body):
	player_at_start = true
	var keys = get_node("keys")
	while player_at_start:
		if keys:
			keys.press_move_key()
			await get_tree().create_timer(0.18).timeout
	keys.reset_keys()


func _on_area_2d_body_exited(_body):
	player_at_start = false
