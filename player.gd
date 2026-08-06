extends CharacterBody3D

@export var camera_controller: Node3D
@export var skin: Node3D

@onready var rotation_speed: float = 10.0

const SPEED = 5.0
const JUMP_VELOCITY = 6

var xform : Transform3D

func _physics_process(delta: float) -> void:
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var move_direction = get_move_direction(input_dir)

	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		$SoundJump.play()
		velocity.y = JUMP_VELOCITY
		play_anim("jump")
	elif is_on_floor() and input_dir != Vector2.ZERO:
		play_anim("run")
	elif is_on_floor() and input_dir == Vector2.ZERO:
		play_anim("idle")

	#if is_on_floor():
		#align_with_floor($RayCast3D.get_collision_normal())
		#global_transform = global_transform.interpolate_with(xform,0.3)
	#elif not is_on_floor():
		#align_with_floor(Vector3.UP)
		#global_transform = global_transform.interpolate_with(xform,0.3)
	
	if move_direction:
		velocity.x = move_direction.x * SPEED
		velocity.z = move_direction.z * SPEED
		
		rotate_character(move_direction, delta)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func get_move_direction(input_dir: Vector2) -> Vector3:
	var forward = camera_controller.get_forward_direction()
	var right = camera_controller.get_right_direction()
	return (forward * -input_dir.y + right * input_dir.x).normalized()

func rotate_character(move_direction: Vector3, delta: float):
	var target_rotation = atan2(-move_direction.x, -move_direction.z)
	var new_rotation = lerp_angle(skin.rotation.y, target_rotation, rotation_speed * delta)
	skin.rotation.y = new_rotation

func play_anim(anim: String):
	if $AnimationPlayer.current_animation != anim:
		$AnimationPlayer.play(anim)

func bounce():
	velocity.y = JUMP_VELOCITY * 0.7

#func align_with_floor(floor_normal):
	#xform = global_transform
	#xform.basis.y = floor_normal
	#xform.basis.x = -xform.basis.z.cross(floor_normal)
	#xform.basis = xform.basis.orthonormalized()
