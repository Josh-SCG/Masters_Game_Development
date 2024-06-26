extends Node2D

func _ready():
	$MoreInfoPopUp.visible = false

#Following functions deal with how the buttons will react to being clicked (Button name = scene taken too)
func _on_StartButton_pressed():
	get_tree().change_scene_to_file("res://Assets/Menu Scenes/Level Select.tscn")

func _on_How_to_Play_Button_pressed():
	get_tree().change_scene_to_file("res://Assets/Menu Scenes/How To.tscn")

func _on_CharacterButton_pressed():
	get_tree().change_scene_to_file("res://Assets/Menu Scenes/Character Select.tscn")

func _on_ExitButton_pressed():
	get_tree().quit()

func _on_ResourcesUsedButton_pressed():
	get_tree().change_scene_to_file("res://Assets/Menu Scenes/Credits.tscn")

func _on_external_link_button_pressed():
	#Might want to add multiple files so maybe either a big interactable pdf or webpage from github.io
	$MoreInfoPopUp.visible = true
	#var path = ProjectSettings.globalize_path("res://Assets/Files/Final.pdf")
	#OS.shell_open(path)

func _on_achievements_button_pressed():
	get_tree().change_scene_to_file("res://Assets/Menu Scenes/Achievements.tscn")

func _on_hide_info_button_pressed():
	$MoreInfoPopUp.visible = false
