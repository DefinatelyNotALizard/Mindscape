extends KinematicBody2D

const MINIMUM_DISTANCE = Globals.ACTIVATION_DISTANCE

onready var playerNode = get_node('../../player')


var state = 0


func ring():
	while not state == 0:
		$AudioStreamPlayer.play()
		$AnimationPlayer.play("ringing")
		
		if $AudioStreamPlayer.playing == false:
			$AudioStreamPlayer.play()
		yield(get_tree().create_timer(1.8),"timeout")
		$AnimationPlayer.play("idle")
		yield(get_tree().create_timer(1.8),"timeout")
		#if Input.is_action_pressed("ui_accept"):
			#break
	$AnimationPlayer.play("idle")
	$AudioStreamPlayer.stop()
	
	
	
	
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _physics_process(_delta):
	pass
	#if Input.is_action_pressed("test"):
		#if not state == 1:
			#state = 1
			#ring()

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if Input.is_action_pressed("ui_accept"):
#		state = 0

#This code processes player proximity and manages interaction with player


func _process(delta):
	if (playerNode.global_position.x - self.global_position.x < MINIMUM_DISTANCE and playerNode.global_position.x - self.global_position.x > MINIMUM_DISTANCE * (-1)) and (playerNode.global_position.y - self.global_position.y < MINIMUM_DISTANCE and playerNode.global_position.y - self.global_position.y > MINIMUM_DISTANCE * (-1)):
		_player_near()
	else:
		if Globals.nearby_object == 'Phone':
			Globals.nearby_object = 'void'
	if Globals.interacting == 1 and Globals.nearby_object == 'Phone':
		_trigger_interact()

func _player_near():
	Globals.nearby_object = 'Phone'

func _trigger_interact():
	if state == 0:
		state = 1
		ring()
	else:
		state = 0
	Globals.interacting = 0

