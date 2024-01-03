extends CanvasLayer

var last_sound_index = -1
var contrasenha_navidad = "73914"
var contraseha_cumple = "86205"

func _ready():
	$BackgroundMusic.play()
	$texto.hide()
 
func _on_enter_navidad_text_changed(new_text):
	reproducir_sonido_aleatorio()
	
	if new_text.length() == 5:
		if new_text == contrasenha_navidad:
			#$AcceptNavidad.play()
			$AcceptCum.play()
			$texto.show()
			$BackgroundMusic.stop()
			$EnterNavidad.text = ""	
			$EnterNavidad.editable = false
			#$EnterCum.editable = false
		else:
			$WrongSound.play()
			$EnterNavidad.text = ""	
	

func _on_enter_cum_text_changed(new_text):
	reproducir_sonido_aleatorio()
	if new_text.length() == 5:
		if new_text == contraseha_cumple:
			$AcceptCum.play()
			$EnterCum.text = ""	
			$EnterNavidad.editable = false
			$EnterCum.editable = false
		else:
			$WrongSound.play()
			$EnterCum.text = ""	

func reproducir_sonido_aleatorio():
	var sounds = $KeyBoardSounds.get_children() 	
	var sound_index = -1
	while sound_index == -1 or sound_index == last_sound_index: 
		sound_index = randi() % sounds.size()  
	var sound_to_play = sounds[sound_index]  #
	sound_to_play.play() 
	last_sound_index = sound_index  


func _on_accept_password_finished():
	#get_tree().change_scene_to_file("res://Scenes/Navidad/Nivel1.tscn")
	pass

func _on_accept_cum_finished():
	#get_tree().change_scene_to_file("res://Scenes/Navidad/Nivel1.tscn")
	pass


