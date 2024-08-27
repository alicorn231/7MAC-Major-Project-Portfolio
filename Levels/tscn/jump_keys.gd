extends Node2D

@onready var player_at_start = false


#this does nothing
func _ready():
	pass # Replace with function body.


#this does nothing
func _process(_delta):
	pass

#this playes the keys animation when the player gets close to them
func _on_area_2d_body_entered(body):
	if body.name != "TileMap":
		player_at_start = true
	var keys = get_node("keys")
	while player_at_start:
		if keys:
			keys.press_jump_key()
			await get_tree().create_timer(0.18).timeout
	keys.reset_keys()


#this stops the keys animation when the player walks away
func _on_area_2d_body_exited(_body):
	player_at_start = false
	print(player_at_start)


