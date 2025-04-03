extends Area2D
@onready var animation_player = $AnimationPlayer


func _ready():
	animation_player.active = true


func _on_body_entered(body):
	GameManager.add_score()
	animation_player.play("pickup")
