extends Area2D
export(int) var Velocidad
var Movimiento = Vector2()
var limite
signal golpe
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	hide() #oculta el personaje
	limite = get_viewport_rect().size # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Movimiento = Vector2()
	if Input.is_action_pressed("ui_right"):
		Movimiento.x = Movimiento.x + 1
		print_debug(Movimiento.x)
	if Input.is_action_pressed("ui_left"):
		Movimiento.x-=1
	if Input.is_action_pressed("ui_down"):
		Movimiento.y+=1
	if Input.is_action_pressed("ui_up"):
		Movimiento.y-=1
	if Movimiento.length() > 0: #verifica si se mueve para normalizar la velocidad
		Movimiento = Movimiento.normalized()*Velocidad
	position+= Movimiento*delta
	position.x=clamp(position.x, 0, limite.x)
	position.y=clamp(position.y, 0, limite.y)
#	pass


func _on_Player_body_entered(body):
	hide() #hace hit desaparece
	emit_signal("golpe") #emite las señal
	$CollisionShape2D.disabled = true #llamo a la colision y la desactivo para que deje de recibir daño

func inicio(pos):
	position = pos
	show() #muestra al personaje
	$CollisionShape2D.disabled = false
	
