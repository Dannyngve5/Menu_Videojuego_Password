extends CanvasLayer

var last_sound_index = -1
var contrasenha_navidad = "73914"
var contraseha_cumple = "86205"

func _ready():
	pass
 
func _on_enter_navidad_text_changed(new_text):
	reproducir_sonido_aleatorio()
	
	if new_text.length() == 5:
		if new_text == contrasenha_navidad:
			$AcceptNavidad.play()
			$EnterNavidad.text = ""	
			$EnterNavidad.editable = false
			$EnterCumple.editable = false
		else:
			$WrongSound.play()
			$EnterNavidad.text = ""	
	

func _on_enter_cumple_text_changed(new_text):
	reproducir_sonido_aleatorio()
	if new_text.length() == 5:
		if new_text == contraseha_cumple:
			$AcceptCum.play()
			$EnterCumple.text = ""	
			$EnterNavidad.editable = false
			$EnterCumple.editable = false
		else:
			$WrongSound.play()
			$EnterCumple.text = ""	

func reproducir_sonido_aleatorio():
	var sounds = $KeyBoardSounds.get_children() 	
	var sound_index = -1
	while sound_index == -1 or sound_index == last_sound_index: 
		sound_index = randi() % sounds.size()  
	var sound_to_play = sounds[sound_index]  #
	sound_to_play.play() 
	last_sound_index = sound_index  


func _on_accept_password_finished():
	get_tree().change_scene_to_file("res://Scenes/Navidad/Nivel1.tscn")

func _on_accept_cum_finished():
	get_tree().change_scene_to_file("res://Scenes/Navidad/Nivel1.tscn")
