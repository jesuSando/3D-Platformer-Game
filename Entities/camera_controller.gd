extends Node3D

@export var mouse_sensitivity: float = 0.003

@onready var spring_arm: SpringArm3D = $SpringArm3D
@onready var camera: Camera3D = $SpringArm3D/Camera3D

var h_rotation: float = 0.0
var v_rotation: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_camera(event.relative)


func rotate_camera(mouse_delta: Vector2):
	h_rotation -= mouse_delta.x * mouse_sensitivity
	rotation.y = h_rotation
	
	v_rotation -= mouse_delta.y * mouse_sensitivity
	v_rotation = clamp(v_rotation, deg_to_rad(-60.0), deg_to_rad(45.0))
	spring_arm.rotation.x = v_rotation

func get_forward_direction() -> Vector3:
	var forward = -camera.global_transform.basis.z
	return forward

func get_right_direction() -> Vector3:
	var right = camera.global_transform.basis.x
	return right
