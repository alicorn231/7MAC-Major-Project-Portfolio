extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	



func _on_body_entered(body):
	print("body dieing yayyy")
	if body.name == "player":
		print("player has died")
		##you_died_screen.reveal()
		#await get_tree().create_timer(0.4).timeout
		#print(".4")
		await get_tree().create_timer(0.1).timeout
		body.die()
		print("body die")
		get_tree().paused
		await get_tree().create_timer(1).timeout
		if body.is_inside_tree():
			get_tree().change_scene_to_file("res://sprites/screans/you_died_screen.tscn")
