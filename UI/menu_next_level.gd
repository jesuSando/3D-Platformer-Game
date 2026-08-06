extends Control

func _ready() -> void:
	SoundManager.stop_level_music()
	SoundManager.play_menu_music()
	
func _on_button_pressed() -> void:
	SoundManager.stop_menu_music()
	SoundManager.play_button_sound()
	get_tree().call_deferred("change_scene_to_file", Global.level)
	Global.level_num += 1
