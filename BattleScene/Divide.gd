extends Button


func _pressed():
	$DivisionDialog.visible=true
	$DivisionDialog.popup_centered()