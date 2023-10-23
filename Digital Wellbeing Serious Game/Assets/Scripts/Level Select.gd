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

#Following functions start relevant level selected
func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Assets/Menu Scenes/Main Menu.tscn")

#These functions change the botton box to display information depending on where player is hovering over
func _on_physical_explination_mouse_entered():
	$extraInformation/informationLabel.text = "This level deals with the ideas of physical health in relation to technology. This includes eye strain, back pain, etc."

func _on_menatl_explination_mouse_entered():
	$extraInformation/informationLabel.text = "This level deals with mental health and technology use. This includes concepts such as doomscrolling, FOMO, etc. and how they affect mental health."

func _on_security_explination_mouse_entered():
	$extraInformation/informationLabel.text = "This level deals with devices security. This includes passwords, social engineering concepts and general security practices to follow."

func _on_physical_explination_mouse_exited():
	$extraInformation/informationLabel.text = "Hover over a level's mini description to see more."
	
func _on_menatl_explination_mouse_exited():
	$extraInformation/informationLabel.text = "Hover over a level's mini description to see more."

func _on_security_explination_mouse_exited():
	$extraInformation/informationLabel.text = "Hover over a level's mini description to see more."


func _on_start_physical_button_pressed():
	globalRef.currentLevel = 1
	globalRef.achievementLevelStart = 0
	get_tree().change_scene_to_file("res://Assets/Level Scenes/Level 1/level_1_a.tscn")
