extends StaticBody2D

func destruir():
#	print("Destruído!")
	get_node("sprite").queue_free()
	get_node("shape").queue_free()
	get_node("particles").set_emitting(true)