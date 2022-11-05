extends Button

func _pressed():
	$SubtractionDialog.visible=true
	$SubtractionDialog.popup_centered()
