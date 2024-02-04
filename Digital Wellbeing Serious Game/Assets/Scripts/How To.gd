extends Node

func _on_TextureButton_pressed():
	get_tree().change_scene_to_file("res://Assets/Menu Scenes/Main Menu.tscn")

#Button functions to change info displayed
func _on_Movement_pressed():
	$InfoBox/Info.text = "Move the character with the W,S,A,D or Arrow Keys"

func _on_Interaction_pressed():
	$InfoBox/Info.text = "Interact with menu items by left click and other characters with E"

func _on_Pausing_pressed():
	$InfoBox/Info.text = "Pause with ESC"


func _on_dialogue_pressed():
	$InfoBox/Info.text = "When talking to a character, SPACEBAR will continue the dialogue and select the highlighted response or you can click on the response you want to choose."
