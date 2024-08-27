extends Control

#@onready you_died.visible = false

#func _on_give_up_pressed():
	#get_tree().change_scene_to_file("res://sprites/screans/home_screan.tscn")
	#pass # Replace with function body.
#func _ready():
	#if Input.is_action_just_pressed("space"):
		#var player = get_parent()
		#player.respawn()
		
func _process(delta):
	if Input.is_action_just_pressed("space"):
		var player = get_parent()
		player.respawn()
		


func _on_give_up_pressed():
	get_tree().change_scene_to_file("res://sprites/screans/map.tscn")



func _on_restart_button_pressed():
	var player = get_parent()
	player.respawn()
	
	

	
