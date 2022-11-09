extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var dialog
# Called when the node enters the scene tree for the first time.
func _ready():
	var button = self
	button.connect("pressed", self, "_button_pressed")
	dialog = get_node('/root/BattleScene/FightScene/ButtonControl/Fight/AdditionDialog')


func get_damage_level():
	return 5
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _button_pressed():
	var enemyBar = get_node('/root/BattleScene/HealthBars/Health Bars/EnemyBar') 
	var playerBar = get_node('/root/BattleScene/HealthBars/Health Bars/PlayerBar') 
	var expected_value = dialog.get_expected_value()
	var answerEdit = get_node('../AnswerInputContainer/AnswerEdit')
	var submitted_value = answerEdit.text
	if expected_value == int(submitted_value):
		enemyBar.value -= get_damage_level()
	else:
		playerBar.value -= get_damage_level()
	dialog.visible=false
	dialog.new_question()
	answerEdit.text = ""
	var enemyHealth : float = enemyBar.value
	var playerHealth : float = playerBar.value
	if enemyHealth <= 0.0:
		print("you won!")
		get_tree().change_scene("res://test/Testing.tscn")
	elif playerHealth <= 0.0:
		print("you lost!")
		get_tree().change_scene("res://test/Testing.tscn")
