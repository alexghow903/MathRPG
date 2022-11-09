extends "res://AdditionDialog/AdditionDialog.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func get_format_equation():
	return "%s - %s"

func get_problem_type():
	return "subtract"


func calculate(number_one, number_two):
	return number_one - number_two

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
