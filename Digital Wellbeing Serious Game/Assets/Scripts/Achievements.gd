extends Node2D


@onready var globalRef = get_node("/root/Global")

func _ready():
	$VBoxContainer/HBoxContainer2/AchievementStartLevel/Sprite2D.texture =  load("res://Assets/Misc Art/signpost"+str(globalRef.achievementLevelStart)+".png")
	$VBoxContainer/HBoxContainer2/AchievementFinishLevel/Sprite2D.texture =  load("res://Assets/Misc Art/signpost"+str(globalRef.achievementLevelFinish)+".png")
	$VBoxContainer/HBoxContainer2/AchievementLevel100/Sprite2D.texture =  load("res://Assets/Misc Art/signpost"+str(globalRef.achievementLevel100)+".png")
	$VBoxContainer/HBoxContainer/AchievementReadSign/Sprite2D.texture =  load("res://Assets/Misc Art/signpost"+str(globalRef.achievementSign)+".png")
	$VBoxContainer/HBoxContainer/AchievementMinigame/Sprite2D.texture =  load("res://Assets/Misc Art/signpost"+str(globalRef.achievementMiniGame)+".png")

func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://Assets/Menu Scenes/Main Menu.tscn")



