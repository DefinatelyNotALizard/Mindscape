extends KinematicBody2D

var thisID = 'PC'

const MINIMUM_DISTANCE = Globals.ACTIVATION_DISTANCE

onready var playerNode = get_node('../../player')

var state = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if (playerNode.global_position.x - self.global_position.x < MINIMUM_DISTANCE and playerNode.global_position.x - self.global_position.x > MINIMUM_DISTANCE * (-1)) and (playerNode.global_position.y - self.global_position.y < MINIMUM_DISTANCE and playerNode.global_position.y - self.global_position.y > MINIMUM_DISTANCE * (-1)):
		_player_near()
	else:
		if Globals.nearby_object == thisID:
			Globals.nearby_object = 'void'
	if Globals.interacting == 1 and Globals.nearby_object == thisID:
		_trigger_interact()

func _player_near():
	Globals.nearby_object = thisID

func _trigger_interact():
	if Globals.currentView != thisID:
		Globals.currentView = thisID
	else:
		pass
	Globals.interacting = 0
		



