extends Node

@onready var globalRef = get_node("/root/Global")
@export var PausePopUp:PackedScene
var popUp = null

var start = false

func startFunc():
	start = true

func _physics_process(_delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	pauseGame()
	if Input.is_action_just_pressed("Jump"):
		get_tree().change_scene_to_file("res://Assets/Level Scenes/Level 2/level_2_c.tscn")

func pauseGame(): #Needs popup as unpause process can't happen if game paused; maybe make own sceene
	if Input.is_action_just_pressed("Pause"):
		popUp = PausePopUp.instantiate()
		add_child(popUp)
		get_tree().paused = true
