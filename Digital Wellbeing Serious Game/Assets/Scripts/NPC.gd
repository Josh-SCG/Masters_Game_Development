extends Area2D

@export var NPC_Dialogue:Resource

func _ready():
	add_to_group("NPC")

func startDialogue():
	get_parent().get_node("UI").show_dialogue(NPC_Dialogue, "start")
