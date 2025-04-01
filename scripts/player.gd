extends CharacterBody2D


const SPEED = 100.0

func _ready():
	await get_tree().create_timer(3).timeout
	velocity = Vector2(1, 0).normalized() * SPEED

func _physics_process(delta):
	var direction = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
	direction = direction.normalized()
	
	if direction:
		velocity = direction * SPEED
		print(velocity)
	move_and_slide()
