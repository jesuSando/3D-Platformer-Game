extends Area3D

const ROT_SPEED = 2
@export var hud : CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_y(deg_to_rad(ROT_SPEED))
	
	#if has_overlapping_bodies():
		#queue_free()


func _on_body_entered(body: Node3D) -> void:
	Global.coins += 1
	#print(Global.coins)
	hud.get_node("CoinsLabel").text = str(Global.coins)
	if Global.coins >= Global.COINS_TO_WIN:
		print("victory")
		get_tree().call_deferred("change_scene_to_file", "res://menu_win.tscn")
		
	set_collision_layer_value(3, false)
	set_collision_mask_value(1, false)
	$AnimationPlayer.play("bounce")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
