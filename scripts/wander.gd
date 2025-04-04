extends State

@export var enemy: CharacterBody2D
@export var move_speed : float = 80.0
@onready var animation_tree = $"../../AnimationTree"

var direction : Vector2
var wander_time : float

func randomize_wander():
	direction = Vector2(randf_range(-1, 1), randf_range(-1, 1))
	if direction.y > direction.x:
		direction.x = 0
	else:
		direction.y = 0
	direction = direction.normalized()
	print(direction)
	wander_time = randf_range(0, 1)

func Enter():
	randomize_wander()

func Update(delta):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()

func Physics_Update(delta):
	if direction == Vector2.ZERO:
		pass
	else:
		animation_tree.set("parameters/walk/blend_position", direction)
	if enemy:
		enemy.velocity = direction * move_speed
	
