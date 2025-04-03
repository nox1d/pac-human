extends CharacterBody2D

@onready var animation_tree = $AnimationTree

const SPEED = 100.0
var get_input = false

func _ready():
	await get_tree().create_timer(3).timeout
	velocity = Vector2(1, 0).normalized() * SPEED
	animation_tree.active = true
	get_input = true
	

func _physics_process(delta):
	if !get_input:
		pass
	else:
		var direction = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
		if direction.y != 0:
			direction.x = 0
		else:
			direction.y = 0
		
		direction = direction.normalized()
		
		if direction == Vector2.ZERO:
			pass
		else:
			animation_tree.set("parameters/walk/blend_position", direction)
			#print(direction)
		
		if direction:
			velocity = direction * SPEED
			#print(velocity)
		move_and_slide()
