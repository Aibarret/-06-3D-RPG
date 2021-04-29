extends Control


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Label.text = "YOU HAVE FAILED YOUR EXAM, SCORE: " + str(Global.score)


func _on_Play_pressed():
	get_tree().change_scene("res://Game.tscn")
	Global.reset()


func _on_Quit_pressed():
	get_tree().quit()
