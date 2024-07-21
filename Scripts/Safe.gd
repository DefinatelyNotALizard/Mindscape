extends KinematicBody2D

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


func _physics_process(delta):
	if Input.is_action_pressed("test"):
		if not state == 1:
			state = 1
			ring()
		

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		state = 0



