extends Node

func _on_play_pressed():
#	print("Mudar de tela!")
	transition.fade_to("res://scenes/game.tscn")
