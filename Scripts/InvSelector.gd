extends KinematicBody2D


var Indexposition = 0

var speed = 1875
#31.24


var velocity = Vector2()
#onready var sprite = get_node("selector")

func _physics_process(delta: float) -> void:
	#left and right
	velocity.x = 0
	
	if Input.is_action_just_pressed("ui_left"):
		if Indexposition > 0:
			Indexposition -= 1
			velocity.x -= speed
		else:
			Indexposition = 7
			velocity.x += speed * 7
	elif Input.is_action_just_pressed("ui_right"):
		if Indexposition < 7:
			Indexposition += 1
			velocity.x += speed
		else:
			Indexposition = 0
			velocity.x -= speed * 7
	elif Input.is_action_just_released("ui_accept"):
		if Indexposition == 0:
			pass
		else:
			pass
	velocity = move_and_slide(velocity, Vector2.UP)
