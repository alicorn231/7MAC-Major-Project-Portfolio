extends Area2D

signal player_dead

#does nothing
func _ready():
	pass

#when something enters the acid, if bdoy, is not "tile map"
#Wait a little it, kill the body, show the bodys death screan,
func _on_body_entered(body):
	if body.name != "TileMap":
		await get_tree().create_timer(0.1).timeout
		if body.is_inside_tree():
			body.die()
			await get_tree().create_timer(0.2).timeout
			body.show_death_screen()
			await get_tree().create_timer(2).timeout

