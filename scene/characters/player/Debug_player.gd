extends CharacterBody3D


const SPEED: float = 5.0
const JUMP_VELOCITY: float = 7
const CAMERA_SPEED: float = 0.005

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var camera: Camera3D = $"3DGodotRobot/Camera3D"


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	camera.rotation_degrees.x -= mouseDelta.y * lookSensitivity * delta
  
  # clamp camera x rotation axis
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, minLookAngle, maxLookAngle)
  
  # rotate the player along their y-axis
	rotation_degrees.y -= mouseDelta.x * lookSensitivity * delta
  
  # reset the mouseDelta vector
	mouseDelta = Vector2()
	
	move_and_slide()

# cam look
var minLookAngle : float = -90.0
var maxLookAngle : float = 90.0
var lookSensitivity : float = 10.0
# vectors
var vel : Vector3 = Vector3()
var mouseDelta : Vector2 = Vector2()

func _input(event):
  
	if event is InputEventMouseMotion:
		mouseDelta = event.relative
