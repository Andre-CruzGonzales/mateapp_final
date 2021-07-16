extends Node

export(PackedScene) var Roca #agregar la escena
var score

func _ready():
	randomize() #aleatorio salen las rocas

func nuevo_juego():
	score = 0
	$Player.inicio($Position2D.position) #posicion de inicio del jugador
	$InicioTimer.start()
	$CanvasLayer.mostrar_mensaje("LISTO")
	$CanvasLayer.update_score(score)
	$Musica.play()
	
	



func game_over():
	$ScoreTimer.stop()
	$RocaTimer.stop()
	$CanvasLayer.game_over()
	$AudioMuerte.play()
	$Musica.stop()
	

	


func _on_InicioTimer_timeout():
	$RocaTimer.start()
	$ScoreTimer.start()


func _on_ScoreTimer_timeout():
	score +=1
	$CanvasLayer.update_score(score)
	#pass


func _on_RocaTimer_timeout():
	$Camino/rocaPosicion.set_offset(randi()) #Selecciona lugar aleatorio en el camino de la roca
	var R = Roca.instance()
	add_child(R)
	#seleeciona una direccion de la roca
	var direcc= $Camino/rocaPosicion.rotation +PI/2
	
	R.position = $Camino/rocaPosicion.position
	
	direcc += rand_range(-PI/4,PI/4) #-45° 45°
	R.rotation = direcc
	R.set_linear_velocity(Vector2(rand_range(R.velocidad_min, R.velocidad_max),0).rotated(direcc))
	
	
