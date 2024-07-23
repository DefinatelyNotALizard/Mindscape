extends KinematicBody2D



#This code processes player proximity and manages interaction with player
const MINIMUM_DISTANCE = Globals.ACTIVATION_DISTANCE

onready var playerNode = 'res://Scenes/player.tscn'

onready var thisNode = 'res://Scenes/Safe.tscn'

func _process(delta):
	if (playerNode.global_position.x - thisNode.global_position.x < MINIMUM_DISTANCE and playerNode.global_position.x - thisNode.global_position.x > MINIMUM_DISTANCE * (-1)) or (playerNode.global_position.y - thisNode.global_position.y < MINIMUM_DISTANCE and playerNode.global_position.y - thisNode.global_position.y > MINIMUM_DISTANCE * (-1)):
		_player_near()
	else:
		if Globals.nearby_object == thisNode:
			Globals.nearby_object = 'void'
	if Globals.interacting == 1 and Globals.nearby_object == thisNode:
		_trigger_interact()

func _player_near():
	Globals.nearby_object = thisNode

func _trigger_interact():
	pass
