extends Control

var volGeneral = 0
var volMusic = 0
var volVoice = 0
var volDb

onready var volGeneralSlider  = $VBoxContainer/HBoxContainer/Panel/HBoxContainer/VBoxContainer/HBoxContainer/VolGeneral
onready var volMusicSlider    = $VBoxContainer/HBoxContainer/Panel/HBoxContainer/VBoxContainer/HBoxContainer3/VolMusica
onready var volVoiceSlider    = $VBoxContainer/HBoxContainer/Panel/HBoxContainer/VBoxContainer/HBoxContainer2/VolVoces

func _ready() -> void:
	volDb = AudioServer.get_bus_peak_volume_left_db(0,0)
	_load_config()
	volGeneralSlider.value = volGeneral
	volMusicSlider.value = volMusic
	volVoiceSlider.value = volVoice

func _save_config():
	var config = ConfigFile.new()
	config.set_value("general", "volume", volGeneral)
	config.set_value("music", "volume", volMusic)
	config.set_value("voice", "volume", volVoice)
	config.save("config.cfg")
	if volMusic == 0:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 2*(volMusic/100))

func _load_config():
	var config = ConfigFile.new()
	config.load("config.cfg")
	volGeneral = config.get_value("general", "volume", 100)
	volMusic = config.get_value("music", "volume", 100)
	volVoice = config.get_value("voice", "volume", 100)
	if volMusic == 0:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 2*(volMusic/100))

func _on_Aceptar_pressed() -> void:
	_save_config()
	queue_free()

func _on_Volver_pressed() -> void:
	queue_free()

func _on_VolGeneral_value_changed(value:float) -> void:
	volGeneral = value

func _on_VolVoces_value_changed(value:float) -> void:
	volVoice = value

func _on_VolMusica_value_changed(value:float) -> void:
	volMusic = value
