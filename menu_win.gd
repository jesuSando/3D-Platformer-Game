extends Control



func _on_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://menu_title.tscn")
