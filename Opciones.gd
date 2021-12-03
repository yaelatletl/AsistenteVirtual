extends Control

var volGeneral = 0
var volMusic = 0
var volVoice = 0

onready var volGeneralSlider  = $VBoxContainer/HBoxContainer/Panel/HBoxContainer/VBoxContainer/HBoxContainer/VolGeneral
onready var volMusicSlider    = $VBoxContainer/HBoxContainer/Panel/HBoxContainer/VBoxContainer/HBoxContainer3/VolMusica
onready var volVoiceSlider    = $VBoxContainer/HBoxContainer/Panel/HBoxContainer/VBoxContainer/HBoxContainer2/VolVoces

func _ready() -> void:
	_load_config()
	volGeneralSlider.value = volGeneral
	volMusicSlider.value = volMusic
	volVoiceSlider.value = volVoice

func _save_config():
	var config = ConfigFile.new()
	config.add_value("general", "volume", volGeneral)
	config.add_value("music", "volume", volMusic)
	config.add_value("voice", "volume", volVoice)
	config.save("config.cfg")

func _load_config():
	var config = ConfigFile.new()
	config.load("config.cfg")
	volGeneral = config.get_value("general", "volume")
	volMusic = config.get_value("music", "volume")
	volVoice = config.get_value("voice", "volume")

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
