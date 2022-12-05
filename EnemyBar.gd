extends TextureProgress


# Called when the node enters the scene tree for the first time.
func _ready():
	var fighters = get_node('/root/BattleScene').get_children()[1].get_name()
	var levels = {'Level1Fighters':1,'Level2Fighters':2,'Level3Fighters':3,'Level4Fighters':4,'Level5Fighters':5,'Level6Fighters':6}
	var level = levels[fighters]
	self.value = level * 15
