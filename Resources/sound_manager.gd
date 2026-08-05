extends Control

func _ready() -> void:
	play_menu_music()



func play_enemy_sound():
	$SoundEnemy.play()

func play_coin_sound():
	$SoundCoin.play()

func play_button_sound():
	$SoundButton.play()

func play_fall_sound():
	$SoundFall.play()

func play_menu_music():
	$MusicMenu.play()

func stop_menu_music():
	$MusicMenu.stop()

func play_level_music():
	$MusicLevel.play()

func stop_level_music():
	$MusicLevel.stop()
