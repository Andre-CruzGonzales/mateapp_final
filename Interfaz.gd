extends CanvasLayer

signal iniciar_juego

func mostrar_mensaje(texto):
	$Mensaje.text = texto
	$Mensaje.show()
	$MensajeTimer.start()

func game_over():
	mostrar_mensaje("GAME OVER")
	yield($MensajeTimer, "timeout")
	$Button.show()
	$Mensaje.text="Space Ship"
	
func update_score(Puntos):
	$ScoreLabel.text=str(Puntos)



func _on_MensajeTimer_timeout():
	#pass # Replace with function body.
	$Mensaje.hide()
	


func _on_Button_pressed():
	#pass # Replace with function body.
	$Button.hide()
	emit_signal("iniciar_juego")
