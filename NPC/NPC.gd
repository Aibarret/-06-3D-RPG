extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")

var count = 0

var dialogue = [
	"Welcome to the game! (press E to continue)"
	,"You must find and destroy all the targets then destroy the drone."
	,"if you run out of time you will lose."
	,"Press E to accept the challenge, Press ESC to reject it."
]

func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.connect("finished_dialogue", self, "finished")


func _on_Area_body_entered(body):
	count += 1 #Dialogue can only be triggered once per game
	if count < 2:
		Global.update_score(0) #update_score is now triggered on starting dialogue
		Dialogue.start_dialogue(dialogue)


func _on_Area_body_exited(body):
	Dialogue.hide_dialogue()

func finished():
	get_node("/root/Game/Target_container").show()
	Global.timer = 120
	Global.update_time()
	get_node("/root/Game/UI/Timer").start()
