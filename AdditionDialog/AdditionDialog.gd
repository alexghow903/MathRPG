extends WindowDialo

# load random number generator object
var rng = RandomNumberGenerator.new(

# Called when the node enters the scene tree for the first time.
func _ready():
	# randomly generate two numbers
	var number_one = rng.randi_range(1, 9)
	var number_two = rng.randi_range(1, 9)
	var format_equation = "%s + %s"
	var equation = format_equation % [number_one, number_two]
	
	$EquationLabel.set_text(equation)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
