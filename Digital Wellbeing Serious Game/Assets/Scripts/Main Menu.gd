extends Node2D

#Following functions deal with how the buttons will react to being clicked
func _on_StartButton_pressed():
	get_tree().change_scene_to_file("res://Assets/Menu Scenes/Level Select.tscn")

func _on_How_to_Play_Button_pressed():
	get_tree().change_scene_to_file("res://Assets/Menu Scenes/How To.tscn")

func _on_CharacterButton_pressed():
	get_tree().change_scene_to_file("res://Assets/Menu Scenes/Character Select.tscn")

func _on_ExitButton_pressed():
	get_tree().quit()

func _on_ResourcesUsedButton_pressed():
	OS.shell_open("http://godotengine.org")



