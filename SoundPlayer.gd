extends Node

@onready var pickup_coin_audio: AudioStreamPlayer = $AudioPlayers/Coin
@onready var chest_open: AudioStreamPlayer = $AudioPlayers/ChestOpen
@onready var ambient_sunny: AudioStreamPlayer = $AudioPlayers/Ambient
@onready var ambient_rain: AudioStreamPlayer = $AudioPlayers/AmbientRain
@onready var star: AudioStreamPlayer = $AudioPlayers/Star
@onready var poof: AudioStreamPlayer = $AudioPlayers/Poof
@onready var pickup_key: AudioStreamPlayer = $AudioPlayers/Key

func play_coin_sound():
	pickup_coin_audio.play()
	
func play_chest_open_sound():
	chest_open.play()

func play_star_sound():
	star.play()

func play_poof_sound():
	poof.play()

func play_key_sound():
	pickup_key.play()

func play_rain_sound():
	ambient_rain.play()

func play_sunny_sound():
	ambient_sunny.play()
