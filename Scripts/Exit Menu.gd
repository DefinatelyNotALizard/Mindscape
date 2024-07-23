extends Node2D


var Indexposition = 1



func _process(_delta):
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
			get_tree().change_scene("res://Root.tscn")
		else:
			self.visible = false
	elif Input.is_action_just_released("ui_cancel"):
		if self.visible == false:
			self.visible = true
			Indexposition = 0
		else:
			pass
	


func _ready():
	self.visible = false
