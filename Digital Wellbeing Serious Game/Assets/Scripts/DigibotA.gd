extends Area2D

@export var NPC_Dialogue:Resource
@onready var globalRef = get_node("/root/Global")

func _ready():
	add_to_group("NPC")

#Displays current entity's "content" in the dialogue popup with NPC_Dialogue being set in editor
func startDialogue():
	get_parent().get_node("UI").show_dialogue(NPC_Dialogue, "start")

