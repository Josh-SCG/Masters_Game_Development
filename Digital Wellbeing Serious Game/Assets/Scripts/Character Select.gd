extends Node2D

@onready var globalRef = get_node("/root/Global")

func _ready():
	pass # Replace with function body.
	
func _physics_process(_delta): #up is negative, reversed in games; strange i forgot this :p -> had the comment [A,D],[W,S] = [-1,1]
	globalRef.spriteSheetRef = "res://Assets/Player//Player Sprites//"+globalRef.gender+globalRef.skinTone+globalRef.outfit+globalRef.hairStyle+globalRef.hairColour+".png"
	changeSprite()

func changeSprite():
	$CharacterSprite.texture = load(globalRef.spriteSheetRef)

#Sprite sheet selection works on following system:
# Gender Apperance: {Male, Female} == {M,F}
# Skin Tone: {Black, White} == {B,W}
# Outfit Worn: {Formal, Casual} = {F,C}
# Hair Style: {Short, Long} = {S,L}
# Hair Colour: {Dark, Light} = {D,L}
#
# Sprite sheet are saved as, eg. MBFSD.png, and the selection
# will produce a string and ammend that to the path of required sprite.

#Sprites to be sourced from: retro-sprite-creator.nihey.org

func _on_gender_button_pressed():
	if globalRef.gender == "M":
		globalRef.gender = "F"
	elif globalRef.gender == "F":
		globalRef.gender = "M"
		
func _on_skin_tone_button_pressed():
	if globalRef.skinTone == "W":
		globalRef.skinTone = "B"
	elif globalRef.skinTone == "B":
		globalRef.skinTone = "W"

func _on_outfit_button_pressed():
	if globalRef.outfit == "F":
		globalRef.outfit = "C"
	elif globalRef.outfit == "C":
		globalRef.outfit = "F"

func _on_hair_button_pressed():
	if globalRef.hairStyle == "S":
		globalRef.hairStyle = "L"
	elif globalRef.hairStyle == "L":
		globalRef.hairStyle = "B"
	elif globalRef.hairStyle == "B":
		globalRef.hairStyle = "S"

func _on_hair_colour_button_pressed():
	if globalRef.hairColour == "D":
		globalRef.hairColour = "L"
	elif globalRef.hairColour == "L":
		globalRef.hairColour = "D"
		

func _on_done_button_pressed():
	get_tree().change_scene_to_file("res://Assets/Menu Scenes/Main Menu.tscn")
