extends CharacterBody2D


const SPEED = 100.0


func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
	if direction:
		velocity = direction * SPEED
		print(velocity)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
