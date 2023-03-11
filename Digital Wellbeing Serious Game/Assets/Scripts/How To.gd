extends Node

func _on_TextureButton_pressed():
	get_tree().change_scene_to_file("res://Assets/Menu Scenes/Main Menu.tscn")


func _on_Movement_pressed():
	$InfoBox/Info.text = "Move the character with the W,S,A,D or Arrow Keys"


func _on_Interaction_pressed():
	$InfoBox/Info.text = "Interact with menu items by left click and other characters with Spacebar or E"


func _on_Pausing_pressed():
	$InfoBox/Info.text = "Pause with ESC or Q"
