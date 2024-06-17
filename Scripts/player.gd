extends KinematicBody2D


var speed = 100


var velocity = Vector2()
onready var sprite = get_node("player")

func _physics_process(delta: float) -> void:
	#left and right
	velocity.x = 0
	velocity.y = 0
	
	if Input.is_action_pressed("right"):
		$AnimationPlayer.play("walk_right")
		velocity.x += speed

	elif Input.is_action_pressed("left"):
		velocity.x -= speed
		$AnimationPlayer.play("walk_left")
		
	elif Input.is_action_pressed("up"):
		velocity.y -= speed
		$AnimationPlayer.play("walk_back")
		
	elif Input.is_action_pressed("down"):
		velocity.y += speed
		$AnimationPlayer.play("walk_front")
	
	else:
		# Switch to idle animation when the "D" key is not pressed
		if $AnimationPlayer.current_animation != "idle":
			$AnimationPlayer.play("idle")
	
	velocity = move_and_slide(velocity, Vector2.UP)


	

		
func _ready():
	$AnimationPlayer.play("idle")
	pass




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
