extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var dialog
var fighters
# Called when the node enters the scene tree for the first time.
func _ready():
	var button = self
	button.connect("pressed", self, "_button_pressed")
	dialog = get_node('/root/BattleScene/ButtonControl/Fight/AdditionDialog')
	fighters = get_node('/root/BattleScene').get_children()[1].get_name()


func get_damage_level():
	#Return amount of damage done by this math operation.
	return 5
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _button_pressed():
	#Determine what level we're on
	var levels = {'Level1Fighters':1,'Level2Fighters':2,'Level3Fighters':3,'Level4Fighters':4,'Level5Fighters':5,'Level6Fighters':6}
	var level = levels[fighters]

	var scenes = [
		'res://test/Testing.tscn',
		'res://tilemap1bw/bwtilemap.tscn',
		'res://tilemap2 g1/grasstilemap.tscn',
		'res://tilemap3 castle/castle.tscn',
		'res://tilemap4/grasspart2.tscn',
		'res://tilemap5/ocean.tscn',
		'res://ui/VictoryMenu.tscn']

	# Check for correctness and deliver appropriate damage
	var enemyBar = get_node('/root/BattleScene/HealthBars/Health Bars/EnemyBar') 
	var playerBar = get_node('/root/BattleScene/HealthBars/Health Bars/PlayerBar') 
	var expected_value = dialog.get_expected_value()
	var answerEdit = get_node('../AnswerInputContainer/AnswerEdit')
	var submitted_value = answerEdit.text
	if expected_value == int(submitted_value):
		enemyBar.value -= get_damage_level()
		dialog.new_question(true)
	else:
		playerBar.value -= get_damage_level()
		dialog.new_question(false)
	dialog.visible=false
	answerEdit.text = ""

	# Check for win or loss
	var enemyHealth : float = enemyBar.value
	var playerHealth : float = playerBar.value
	if enemyHealth <= 0.0:
		get_tree().change_scene(scenes[level])
	elif playerHealth <= 0.0:
		print("you lost!")
		get_tree().change_scene("res://test/Testing.tscn")
