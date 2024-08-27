extends Node2D

@onready var player_in_area = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var keys = get_node("keys")	
	keys.reset_keys()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_area_2d_body_entered(_body):
	#player_at_start = true
	var keys = get_node("keys")
	while player_in_area:
		if keys:
			keys.press_jump_key()
			await get_tree().create_timer(0.18).timeout
	keys.reset_keys()



#func _on_area_2d_area_exited(_area):
	#


func _on_area_2d_body_exited(_body):
	player_in_area = false
