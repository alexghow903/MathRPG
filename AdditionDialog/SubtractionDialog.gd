extends "res://AdditionDialog/AdditionDialog.gd"




# Called when the node enters the scene tree for the first time.
func get_format_equation():
	return "%s - %s"

func get_problem_type():
	return "subtract"


func calculate(number_one, number_two):
	return number_one - number_two

