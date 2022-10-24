extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var button = self
	button.connect("pressed", self, "_button_pressed")
	add_child(button)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _button_pressed():
	var enemyBar = get_node('/root/BattleScene/HealthBars/Health Bars/EnemyBar') 
	var playerBar = get_node('/root/BattleScene/HealthBars/Health Bars/PlayerBar') 
	enemyBar.value -= 10
