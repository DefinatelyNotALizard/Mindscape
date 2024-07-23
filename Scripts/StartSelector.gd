extends KinematicBody2D

var Indexposition = 0


var speed = 1100


var velocity = Vector2()
#onready var sprite = get_node("selector")

func _physics_process(_delta: float) -> void:
	#left and right
	velocity.x = 0
	velocity.y = 0
	
	if Input.is_action_just_pressed("ui_down"):
		if Indexposition < 2:
			Indexposition += 1
			velocity.y += speed
		else:
			Indexposition = 0
			velocity.y -= speed * 2
	elif Input.is_action_just_pressed("ui_up"):
		if Indexposition > 0:
			Indexposition -= 1
			velocity.y -= speed
		else:
			Indexposition = 2
			velocity.y += speed * 2

	

	
	
	velocity = move_and_slide(velocity, Vector2.UP)

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		if Indexposition == 0:
			yield(get_tree().create_timer(0.1),"timeout")#This timer is somehow the lynch pin stopping a horrendous bug.
			#It seems that using action_just_released causes the exit menu to send the player to the main menu then skip back to the main scene
			get_tree().change_scene("res://Scenes/Main.tscn")
		elif Indexposition == 1:
			pass
		else:
			get_tree().quit()

		
func _ready():
	pass




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


