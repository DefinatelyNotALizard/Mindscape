extends KinematicBody2D

var Indexposition = 0

var speed = 1600


var velocity = Vector2()
#onready var sprite = get_node("selector")

func _physics_process(_delta: float) -> void:
	#left and right
	velocity.x = 0
	velocity.y = 0
	
	if Input.is_action_just_released("ui_left"):
		if Indexposition == 1:
			Indexposition = 0
			velocity.x -= speed
		else:
			Indexposition = 1
			velocity.x += speed
	elif Input.is_action_just_released("ui_right"):
		if Indexposition ==1:
			Indexposition = 0
			velocity.x -= speed
		else:
			Indexposition = 1
			velocity.x += speed
	elif Input.is_action_just_released("ui_accept"):
		if Indexposition == 0:
			pass
		else:
			pass
	velocity = move_and_slide(velocity, Vector2.UP)


	

		
func _ready():
	pass




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
