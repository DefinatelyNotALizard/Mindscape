extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(_delta):
	if Globals.currentView != 'full':
		self.visible = false
	else:
		self.visible = true
