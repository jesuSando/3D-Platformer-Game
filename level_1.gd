extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SoundManager.play_level_music()
	Global.coins = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
