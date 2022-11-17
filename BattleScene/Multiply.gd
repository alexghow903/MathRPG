extends Button


func _pressed():
	$MultiplicationDialog.visible=true
	$MultiplicationDialog.popup_centered()