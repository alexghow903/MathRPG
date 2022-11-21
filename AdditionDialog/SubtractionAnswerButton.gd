extends "res://AdditionDialog/AnswerButton.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var button = self
	button.connect("pressed", self, "_button_pressed")
	dialog = get_node('/root/BattleScene/ButtonControl/Run/SubtractionDialog')

func get_damage_level():
	return 5


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
