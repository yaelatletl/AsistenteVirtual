extends Control

export(PackedScene) var Opciones 
export(PackedScene) var PrimeraEscena

var volGeneral = 0
var volMusic = 0
var volVoice = 0
var volDb = 0
func _ready() -> void:
	volDb = AudioServer.get_bus_peak_volume_left_db(0,0)
	_load_config()

func _on_Salir_pressed() -> void:
	get_tree().quit()


func _on_Opciones_pressed() -> void:
	add_child(Opciones.instance())

func _on_Iniciar_pressed() -> void:
	get_tree().change_scene("res://Inicio.tscn")


func _load_config():
	var config = ConfigFile.new()
	config.load("config.cfg")
	volGeneral = config.get_value("general", "volume", 100)
	volMusic = config.get_value("music", "volume", 100)
	volVoice = config.get_value("voice", "volume", 100)
	if volMusic == 0:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 2*(volMusic/100))