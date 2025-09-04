extends CharacterBody3D


@export var CAMERA_CONTROLLER : Camera3D
@export var Pivot : Node3D
@export var MOUSE_SENSITIVITY : float = 0.5
@export var TILT_LOWER_LIMIT := deg_to_rad(-89.0)
@export var TILT_UPPER_LIMIT := deg_to_rad(89.0)
@export var MOVE_SPEED : float = 5.0

var _mouse_input : bool = false
var _rotation_input : float
var _mouse_rotation : Vector3
var _tilt_input : float
var _char_rotation : Vector3
var _camera_rotation : Vector3
var forward : bool

# Called when the node enters the scene tree for the first time.
func _unhandled_input(event):
	_mouse_input = event is InputEventMouseMotion && Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED
	if _mouse_input:
		_rotation_input = -event.relative.x * MOUSE_SENSITIVITY
		_tilt_input = -event.relative.y * MOUSE_SENSITIVITY


func _update_camera(delta):
	_mouse_rotation.x -= _tilt_input * delta
	_mouse_rotation.x = clamp(_mouse_rotation.x, TILT_LOWER_LIMIT, TILT_UPPER_LIMIT)
	_mouse_rotation.y += _rotation_input * delta
	
	_camera_rotation = Vector3(_mouse_rotation.x - deg_to_rad(180.0),0.0,deg_to_rad(180.0))
	_camera_rotation.y -= _char_rotation.y - _mouse_rotation.y
	
	Pivot.transform.basis = Basis.from_euler(_camera_rotation)
	Pivot.rotation.z = 0.0
	
	global_transform.basis = Basis.from_euler(_char_rotation)
	
	_rotation_input = 0.0
	_tilt_input = 0.0

func update_input(speed: float, acceleration: float, deceleration: float) -> void:
	var input_dir = Input.get_vector("Left", "Right", "Forward", "Backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = lerp(velocity.x,-direction.x * speed,acceleration)
		velocity.z = lerp(velocity.z,-direction.z * speed,acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, deceleration)
		velocity.z = move_toward(velocity.z, 0, deceleration)

func update_velocity() -> void:
	move_and_slide()

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_update_camera(delta)
	update_input(5.0,0.5,0.075)
	update_velocity()
