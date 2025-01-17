extends Spatial

onready var _character = $FPSCharacter
onready var _label = $Interface/Label
onready var _bar = $Interface/ExperienceBar


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	_label.update_text(_character.level, _character.experience, _character.experience_required)
	_bar.initialize(_character.experience, _character.experience_required)


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if event.is_action_pressed("shoot"):
		if Input.get_mouse_mode()==Input.MOUSE_MODE_VISIBLE:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			get_tree().set_input_as_handled()

	if not event.is_action_pressed('ui_accept'):
		return
	_character.gain_experience(34)
	_label.update_text(_character.level, _character.experience, _character.experience_required)
