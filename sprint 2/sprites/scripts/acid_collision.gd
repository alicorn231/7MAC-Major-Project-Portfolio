extends Area2D

signal player_dead

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
	



func _on_body_entered(body):
	if body.name != "TileMap":
		await get_tree().create_timer(0.1).timeout
		if body.is_inside_tree():
			body.die()
			await get_tree().create_timer(0.4).timeout
			body.show_death_screen()
			#await get_tree().create_timer(6).timeout
			player_dead.emit()
