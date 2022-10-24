extends WindowDialog

# load random number generator object
var rng = RandomNumberGenerator.new()
var expected_value = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	new_question()

func get_expected_value():
	return expected_value

func new_question():
	# Randomize rng so it is not the same seed every time
	rng.randomize()
	
	# randomly generate two numbers
	var number_one = rng.randi_range(1, 9)
	var number_two = rng.randi_range(1, 9)
	
	# Create string with random numbers assigned
	var format_equation = "%s + %s"
	var equation = format_equation % [number_one, number_two]
	expected_value = number_one+number_two
	
	# Set label text as equation string
	$MarginContainer/VBoxContainer/EquationLabel.set_text(equation)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
