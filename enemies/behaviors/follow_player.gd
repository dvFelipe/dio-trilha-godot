extends Node

@export var speed: float = 1

var enemy: Enemy
var sprite: AnimatedSprite2D


func _ready():
	enemy = get_parent()
	sprite = enemy.get_node("AnimatedSprite2D")

func _physics_process(delta: float) -> void:
	# Ignorar se game over
	if GameManager.is_game_over: return
	
	# Calculate direction
	var player_position = GameManager.player_position
	var difference = player_position - enemy.position
	var input_vector = difference.normalized()
	
	# Moviment
	enemy.velocity = input_vector * speed * 100.0
	enemy.move_and_slide()

	# Flip animatedsprite
	if input_vector.x > 0:
		sprite.flip_h = false
	elif input_vector.x < 0:
		sprite.flip_h = true
