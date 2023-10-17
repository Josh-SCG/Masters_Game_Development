extends Area2D

@export var NPC_Dialogue:Resource

func _ready():
	add_to_group("NPC")

#Displays current entity's "content" in the dialogue popup with NPC_Dialogue being set in editor
func startDialogue():
	get_parent().get_node("UI").show_dialogue(NPC_Dialogue, "start")


func returnToMenu():
	get_tree().change_scene_to_file("res://Assets/Menu Scenes/Main Menu.tscn")
