extends "res://AdditionDialog/AnswerButton.gd"




# Called when the node enters the scene tree for the first time.
func _ready():
	var button = self
	button.connect("pressed", self, "_button_pressed")
	dialog = get_node('/root/BattleScene/ButtonControl/Run/SubtractionDialog')
	fighters = get_node('/root/BattleScene').get_children()[1].get_name()

func get_damage_level():
	return 10

