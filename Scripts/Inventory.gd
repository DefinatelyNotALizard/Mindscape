extends Node2D


var Indexposition = 0



func _process(delta):
	if Input.is_action_just_released("ui_left"):
		if Indexposition == 1:
			Indexposition = 0
		else:
			Indexposition = 1
	elif Input.is_action_just_released("ui_right"):
		if Indexposition ==1:
			Indexposition = 0
		else:
			Indexposition = 1
	elif Input.is_action_just_released("ui_accept"):
		if Indexposition == 0:
			pass
		else:
			self.visible = true
	elif Input.is_action_just_released("ui_cancel"):
		self.visible = false
