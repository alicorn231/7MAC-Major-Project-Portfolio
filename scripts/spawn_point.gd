extends Area2D


#does ntohing
func _ready():
	pass # Replace with function body.


func _on_body_entered(body):
	#if plyer at finsih, call fucntion at_finish()
	if body.name != "TileMap":
		body.at_finish()
