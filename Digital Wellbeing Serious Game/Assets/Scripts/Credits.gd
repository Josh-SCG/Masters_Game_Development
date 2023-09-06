extends Node2D

func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://Assets/Menu Scenes/Main Menu.tscn")

func _on_char_link_pressed():
	OS.shell_open("https://retro-sprite-creator.nihey.org/character")

func _on_ui_link_pressed():
	OS.shell_open("https://opengameart.org/content/lpc-pennomis-ui-elements")

func _on_dialogue_manager_link_pressed():
	OS.shell_open("https://github.com/nathanhoad/godot_dialogue_manager")

func _on_bot_link_pressed():
	OS.shell_open("https://opengameart.org/content/gum-bot-sprites")


func _on_ui_bg_link_pressed():
	OS.shell_open("https://opengameart.org/content/grid-background")
