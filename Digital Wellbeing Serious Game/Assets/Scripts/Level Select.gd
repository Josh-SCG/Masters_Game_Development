extends Node2D

@onready var globalRef = get_node("/root/Global")

#Set the display of level completion
func _ready():
	$PhysicalLevelBox/Complete.texture =  load("res://Assets/UI/checkbox_"+str(globalRef.levelComplete1)+".png")
	$MentalLevelBox/Complete.texture =  load("res://Assets/UI/checkbox_"+str(globalRef.levelComplete2)+".png")
	$SecurityLevelBox/Complete.texture =  load("res://Assets/UI/checkbox_"+str(globalRef.levelComplete3)+".png")
	
	$PhysicalLevelBox/HBoxContainer/Score1.texture =  load("res://Assets/UI/radiobutton_"+str(globalRef.level1Score1)+".png")
	$PhysicalLevelBox/HBoxContainer/Score2.texture =  load("res://Assets/UI/radiobutton_"+str(globalRef.level1Score2)+".png")
	$PhysicalLevelBox/HBoxContainer/Score3.texture =  load("res://Assets/UI/radiobutton_"+str(globalRef.level1Score3)+".png")
	
	$MentalLevelBox/HBoxContainer/Score1.texture =  load("res://Assets/UI/radiobutton_"+str(globalRef.level2Score1)+".png")
	$MentalLevelBox/HBoxContainer/Score2.texture =  load("res://Assets/UI/radiobutton_"+str(globalRef.level2Score2)+".png")
	$MentalLevelBox/HBoxContainer/Score3.texture =  load("res://Assets/UI/radiobutton_"+str(globalRef.level2Score3)+".png")
	
	$SecurityLevelBox/HBoxContainer/Score1.texture =  load("res://Assets/UI/radiobutton_"+str(globalRef.level3Score1)+".png")
	$SecurityLevelBox/HBoxContainer/Score2.texture =  load("res://Assets/UI/radiobutton_"+str(globalRef.level3Score2)+".png")
	$SecurityLevelBox/HBoxContainer/Score3.texture =  load("res://Assets/UI/radiobutton_"+str(globalRef.level3Score3)+".png")

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Assets/Menu Scenes/Main Menu.tscn")

func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://World.tscn")
