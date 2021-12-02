extends Control

export(PackedScene) var Opciones 
export(PackedScene) var PrimeraEscena

func _on_Salir_pressed() -> void:
	get_tree().quit()


func _on_Opciones_pressed() -> void:
	add_child(Opciones.instance())

func _on_Iniciar_pressed() -> void:
	get_tree().change_scene(PrimeraEscena.instance())
