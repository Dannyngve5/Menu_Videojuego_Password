extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var last_direction = Vector2.RIGHT
var is_jumping = false

var is_on_floor_prev = false


func _ready():
	$SpriteL.hide()
	$PlayerAnimation.play("idle_r")

func _physics_process(delta):
	var is_on_floor_now = is_on_floor()
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		is_jumping = true
	else:
		is_jumping = false

	# Handle jump.
	if (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("up")) and !is_jumping:
		if last_direction == Vector2.LEFT :
			$PlayerAnimation.play("jump_l")
		else:
			$PlayerAnimation.play("jump_r")
		velocity.y = JUMP_VELOCITY

		# Reinicia la animación de salto si ya está en curso
		if $PlayerAnimation.is_playing():
			$PlayerAnimation.stop()
			$PlayerAnimation.play("jump_l" if last_direction == Vector2.LEFT else "jump_r")

	is_on_floor_prev = is_on_floor_now

	var direction = 0.0
	
	
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("left"):
		direction -= 1.0
		$SpriteL.show()
		$SpriteR.hide()
		last_direction = Vector2.LEFT
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("right"):
		direction += 1.0
		$SpriteL.hide()
		$SpriteR.show()
		last_direction = Vector2.RIGHT

	if direction != 0.0:
		velocity.x = direction * SPEED
		if not is_jumping:
			if last_direction == Vector2.LEFT:
				$PlayerAnimation.play("walk_left")
			else:
				$PlayerAnimation.play("walk_right")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			if last_direction == Vector2.LEFT:
				$PlayerAnimation.play("idle_l")
			else:
				$PlayerAnimation.play("idle_r")
		else:
			if last_direction == Vector2.LEFT:
				$PlayerAnimation.play("idle_jump_l")
				pass
			else:
				$PlayerAnimation.play("idle_jump_r")
				pass
	move_and_slide()
