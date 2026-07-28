extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CoinsLabel.text = str(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#$CoinsLabel.text = str(Global.coins)
	pass
	
