extends RigidBody2D

export(int) var velocidad_min
export(int) var velocidad_max
var tipo_roca = ["meteoro"]

func _ready():
	$AnimatedSprite.animation = tipo_roca[randi() % tipo_roca.size()]
	



func _on_VisibilityNotifier2D_screen_exited(): #meteoro sale de la pantalla
	queue_free() #elimina roca
