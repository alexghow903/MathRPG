extends Node2D


func next_scene():
	get_tree().change_scene("res://ui/StartMenu.tscn")


func _on_Button_pressed():
	get_tree().change_scene("res://test/Testing.tscn")
	pass # Replace with function body.
