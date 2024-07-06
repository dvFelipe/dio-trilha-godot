extends Node

signal game_over

var player: Player
var player_position: Vector2
var is_game_over: bool = false

var time_elepsed: float = 0.0
var time_elepsed_str: String
var meat_counter: int = 0
var monster_defeated_counter: int = 0

func _process(delta: float):
	# Update Timer
	time_elepsed += delta
	var time_elepsed_in_seconds: int = floori(time_elepsed)
	var seconds: int = time_elepsed_in_seconds % 60
	var minutes: int = time_elepsed_in_seconds / 60
	
	time_elepsed_str = "%02d:%02d" % [minutes, seconds]

func end_game():
	if is_game_over: return
	is_game_over = true
	game_over.emit()

func reset():
	player = null
	player_position = Vector2.ZERO
	is_game_over = false
	
	time_elepsed = 0.0
	time_elepsed_str = "00:00"
	meat_counter = 0
	monster_defeated_counter = 0
	
	for connetion in game_over.get_connections():
		game_over.disconnect(connetion.callable)
