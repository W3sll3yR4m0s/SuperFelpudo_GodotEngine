extends Node

onready var character = get_node("character")
onready var dead_camera = get_node("dead_camera")

var moedas = 0
var vidas = 3

func _ready():
	set_process(true)

func _process(delta):
	get_node("canvasLayer/panel/time").set_text(str(int(get_node("game_time").get_time_left())))

func change_camera():
	dead_camera.set_global_pos(character.get_node("camera").get_camera_pos())
	dead_camera.make_current()

func _on_character_morreu():
	change_camera()
	
	get_node("spawn_time").set_wait_time(2)
	get_node("spawn_time").start()
	
	vidas -= 1
	ajustaQtdeVidas()


func _on_spawn_time_timeout():
	if vidas > 0:
		reviver()
	else:
		transition.fade_to("res://scenes/mainMenu.tscn")



func reviver():
	character.set_pos(get_node("spawn_point").get_pos())
	character.reviver()
	
	get_node("game_time").set_wait_time(30)
	get_node("game_time").start()

func _on_character_fim():
	change_camera()
	
	get_node("spawn_time").set_wait_time(3)
	get_node("spawn_time").start()


func _on_character_moeda():
	moedas += 1
	get_node("canvasLayer/panel/contagemMoedas").set_text(str(moedas))


func ajustaQtdeVidas():
	if vidas == 2:
		get_node("canvasLayer/panel/heart1").set_texture(load("res://assets/hud_heartEmpty.png"))
	elif vidas == 1:
		get_node("canvasLayer/panel/heart2").set_texture(load("res://assets/hud_heartEmpty.png"))
	elif vidas == 0:
		get_node("canvasLayer/panel/heart3").set_texture(load("res://assets/hud_heartEmpty.png"))

