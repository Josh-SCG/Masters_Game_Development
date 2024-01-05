extends Node2D

@onready var globalRef = get_node("/root/Global")

func _ready():
	$Score/ScoreText.text = "Score: "+str(globalRef.level3MiniScore)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$Score.visible = false
	$Start.visible = true
	$HowTo.visible = true
	$endLevelButton.visible = false

func _physics_process(_delta):
	$Score/ScoreText.text = "Score: "+str(globalRef.level3MiniScore)
	if Input.is_action_just_pressed("Interact"):
		start()
	if globalRef.level3MiniScore > 9:
		$endLevelButton.visible = true
		$CalcText.text = "Calculated!"
	if globalRef.level3FailState == 4:
		globalRef.level3MiniStart = false
		globalRef.level3FailState = 0
		get_tree().change_scene_to_file("res://Assets/Level Scenes/Level 3/level_3_c.tscn")

func start():
	$Start.visible = false
	$HowTo.visible = false
	$Score.visible = true
	$endLevelButton.visible = false
	globalRef.achievementMiniGame = 0
	globalRef.level3MiniStart = true

func _on_end_level_button_pressed():
	globalRef.level3MiniStart = false
	globalRef.level3FailState = 0
	get_tree().change_scene_to_file("res://Assets/Level Scenes/Level 3/level_3_c.tscn")
