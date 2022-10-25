extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var button = self
	button.connect("pressed", self, "_button_pressed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _button_pressed():
	var enemyBar = get_node('/root/BattleScene/HealthBars/Health Bars/EnemyBar') 
	var playerBar = get_node('/root/BattleScene/HealthBars/Health Bars/PlayerBar') 
	var additionDialog = get_node('/root/BattleScene/FightScene/ButtonControl/Fight/AdditionDialog')
	var expected_value = additionDialog.get_expected_value()
	var answerEdit = get_node('../AnswerInputContainer/AnswerEdit')
	var submitted_value = answerEdit.text
	if expected_value == int(submitted_value):
		enemyBar.value -= 5
	else:
		playerBar.value -=5
	additionDialog.visible=false
	additionDialog.new_question()
	answerEdit.text = ""
