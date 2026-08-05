extends Node

@export var coins_to_win := 0
@export var enemies_to_win := 0
@export_file("*.tscn") var next_level := ""
@export var hud : CanvasLayer
@export var level_title := ""

var finished := false

func _ready() -> void:
	SoundManager.play_level_music()
	Global.coins = 0
	Global.enemies = 0
	if hud:
		if hud.find_child("LevelTitle", true, false):
			hud.get_node("LevelTitle").text = str(level_title)
		if hud.find_child("LevelNumber", true, false):
			hud.get_node("LevelNumber").text = str(Global.level_num)
	else:
		push_warning("el hud no ha sido asignado")

func _process(delta: float) -> void:
	if finished: 
		return

	if coins_to_win > 0 and Global.coins >= coins_to_win:
		finished = true
		finish_level()
	elif enemies_to_win > 0 and Global.enemies >= enemies_to_win:
		finished = true
		finish_level()
	

func finish_level():
	if next_level.is_empty():
		win()
	else:
		Global.level = next_level
		get_tree().call_deferred("change_scene_to_file", "res://UI/menu_next_level.tscn")

func win():
	get_tree().call_deferred("change_scene_to_file", "res://UI/menu_win.tscn")

func game_over():
	get_tree().call_deferred("change_scene_to_file", "res://UI/menu_game_over.tscn")
