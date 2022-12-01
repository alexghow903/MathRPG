extends WindowDialog

# load random number generator object
var rng = RandomNumberGenerator.new()
var expected_value = 0
var difficulty = 0
var difficulty_range = [4,6,8,10,12,25,40,50,100,300]
# Called when the node enters the scene tree for the first time.
func _ready():
	new_question(true)

func get_expected_value():
	return expected_value

func get_format_equation():
	return "%s + %s"

func get_problem_type():
	return "add"

func calculate(number_one,number_two):
	return number_one + number_two

func new_question(more_difficult):
	# Randomize rng so it is not the same seed every time
	rng.randomize()
	
	# randomly generate two numbers
	var number_one = rng.randi_range(1, difficulty_range[difficulty])
	var number_two = 1
	if get_problem_type() == 'divide':
		var possible_nums = []
		for x in range(2,number_one):
			if number_one % x == 0:
				possible_nums.append(x)
		if len(possible_nums) > 0:
			number_two = possible_nums[rng.randi_range(0,len(possible_nums)-1)]
	else:
		number_two = rng.randi_range(2,number_one-1) if get_problem_type() == 'subtract' else rng.randi_range(1, difficulty_range[difficulty])
	# if get_problem_type() == 'subtract':
	# 	var number_two = rng.randi_range(1,number_one)
	# else:
	# 	var number_two = rng.randi_range(1, difficulty_range[difficulty])
	
	# Create string with random numbers assigned
	var format_equation = get_format_equation()
	var equation = format_equation % [number_one, number_two]
	expected_value = calculate(number_one,number_two)

	if difficulty < len(difficulty_range) - 1 and more_difficult:
		difficulty += 1
	elif difficulty > 0 and not more_difficult:
		difficulty -= 1
	
	# Set label text as equation string
	$MarginContainer/VBoxContainer/EquationLabel.set_text(equation)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
