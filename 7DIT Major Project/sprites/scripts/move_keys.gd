extends Node2D

@onready var player_at_start = true

#@onready var keys = $keys
#print(keys)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

#
#func _on_collision_shape_2d_tree_entered():
	#var keys = get_node("keys")
	#if keys:
		#print("yay")
		#keys.press_move_key()


func _on_area_2d_body_entered(_body):
	player_at_start = true
	var keys = get_node("keys")
	while player_at_start:
		if keys:
			keys.press_move_key()
			await get_tree().create_timer(0.18).timeout
	keys.reset_keys()



#func _on_area_2d_area_exited(_area):
	#


func _on_area_2d_body_exited(_body):
	player_at_start = false
