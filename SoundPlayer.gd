extends Node

@onready var pickup_coin_audio: AudioStreamPlayer = $AudioPlayers/Coin
@onready var chest_open: AudioStreamPlayer = $AudioPlayers/ChestOpen
@onready var ambient: AudioStreamPlayer = $AudioPlayers/Ambient
@onready var star: AudioStreamPlayer = $AudioPlayers/Star


func play_coin_sound():
	pickup_coin_audio.play()
	
func play_chest_open_sound():
	chest_open.play()

func play_star_sound():
	star.play()
