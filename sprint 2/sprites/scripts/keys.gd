extends Node2D

@onready var animation = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func press_move_key():
	for i in range(3):
		#print("hi")
		$AnimationPlayer.play("press_left_right")
		
func press_jump_key():
	for i in range(3):
		animation.play("press_up")

func reset_keys():
	animation.play("Stationary")
