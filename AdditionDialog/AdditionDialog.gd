extends WindowDialog

# load random number generator object
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
#func _ready():
#	# Randomize rng so it is not the same seed every time
#	rng.randomize()
#
#	# randomly generate two numbers
#	var number_one = rng.randi_range(1, 9)
#	var number_two = rng.randi_range(1, 9)
#
#	# Create string with random numbers assigned
#	var format_equation = "%s + %s"
#	var equation = format_equation % [number_one, number_two]
#
#	# Set label text as equation string
#	$MarginContainer/VBoxContainer/EquationLabel.set_text(equation)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		# Randomize rng so it is not the same seed every time
	rng.randomize()
	
	# randomly generate two numbers
	var number_one = rng.randi_range(1, 9)
	var number_two = rng.randi_range(1, 9)
	
	# Create string with random numbers assigned
	var format_equation = "%s + %s"
	var equation = format_equation % [number_one, number_two]
	
	# Set label text as equation string
	$MarginContainer/VBoxContainer/EquationLabel.set_text(equation)
