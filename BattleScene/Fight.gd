extends Button

func _ready():
	var button = Button.new()
	button.text = "Fight"
	button.connect("pressed", self, "_button_pressed")
	add_child(button)

func _button_pressed():
	print("Hello world!")
	$AdditionDialog.visible=true
	$AdditionDialog.popup_centered()
