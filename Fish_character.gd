extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var fish_animation = get_node("AnimationPlayer")
@onready var actionable_finder: Area2D = $Direction/Actionable_Finder
var input_vector: Vector2 = Vector2.ZERO

func _physics_process(delta):
	# Add the gravity.
	#Formula for regular gravity on floor: velocity.y += gravity * delta
	if not is_on_floor():
		velocity.y += gravity * delta
		
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$JumpSound.play()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction == -1:
		get_node("AnimatedSprite2D").flip_h = true
	
	elif direction == 1:
		get_node("AnimatedSprite2D").flip_h = false
	if direction:
		velocity.x = direction * SPEED
		fish_animation.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		fish_animation.play("Idle")
	move_and_slide()

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return
	
	var x_axis: float = Input.get_axis("ui_left", "ui_right")
	var y_axis: float = Input.get_axis("ui_up", "ui_down")
	if x_axis:
		input_vector = x_axis * Vector2.RIGHT
	
	elif y_axis:
		input_vector = y_axis * Vector2.DOWN
	else:
		input_vector = Vector2.ZERO
		
func _on_area_2d_body_entered(body):
	if body.get_name() == "Paper" or body.get_name() == "paperr_obstacle":
		# Let the fish respawn
		get_tree().reload_current_scene()


func _on_area_2d_2_body_entered(body):
	if body.get_name() == "Paper2" or body.get_name() == "CharacterBody2D":
		get_tree().reload_current_scene()
