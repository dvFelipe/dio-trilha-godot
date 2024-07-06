extends CanvasLayer

@onready var timer_label: Label = %TimerLabel
@onready var meat_label: Label = %MeatLabel


func _process(delta: float):
	# Update Timer
	timer_label.text = GameManager.time_elepsed_str
	meat_label.text = str(GameManager.meat_counter)
