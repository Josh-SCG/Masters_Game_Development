extends Area2D

@export var NPC_Dialogue:Resource

func _ready():
	add_to_group("NPC")
	$AnimatedSprite2D.visible = true
	$Sprite2D.visible = false

#Displays current entity's "content" in the dialogue popup with NPC_Dialogue being set in editor
func startDialogue():
	$AnimatedSprite2D.visible = false
	$Sprite2D.visible = true
	get_parent().get_node("UI").show_dialogue(NPC_Dialogue, "start")
