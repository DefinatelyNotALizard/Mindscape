extends CanvasLayer

const READ_RATE = 0.03

onready var textbox_container = $TextBoxContainer
onready var end_symbol = $TextBoxContainer/MarginContainer/HBoxContainer/V
onready var main_text = $TextBoxContainer/MarginContainer/HBoxContainer/Text

enum State {
	READY,
	READING,
	FINISHED
}

var current_state = State.READY


func _ready():
	print('start READY')
	hide_textbox()
	add_text('Welcome Grub, your adventure begins here, this will not be easy (btw this is placeholder text), your quest will have many dangers and pitfalls, also watch out for the bathroom on nthe third floor there\'s no toilet paper')

func _process(delta):
	match current_state:
		State.READY:
			pass
		State.READING:
			pass
		State.FINISHED:
			pass

func hide_textbox():
	main_text.text = ''
	end_symbol.text = ''
	textbox_container.hide()

func show_textbox():
	textbox_container.show()

func add_text(payload):
	main_text.text = payload
	change_state(State.READING)
	show_textbox()	
	$AudioStreamPlayer.play()
	$Tween.interpolate_property(main_text, "percent_visible", 0.0, 1.0, len(payload) * READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	


func _on_Tween_tween_all_completed():
	end_symbol.text = 'V'
	$AudioStreamPlayer.stop()
	change_state(State.FINISHED)

func change_state(next):
	print('Change to:')
	current_state = next
	match current_state:
		State.READY:
			print('READY')
		State.READING:
			print('READING')
		State.FINISHED:
			print('FINISHED')
