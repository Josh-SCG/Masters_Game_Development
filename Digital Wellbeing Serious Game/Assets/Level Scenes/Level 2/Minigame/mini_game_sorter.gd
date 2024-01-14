extends Node2D

@onready var globalRef = get_node("/root/Global")
@onready var musicRef = get_node("/root/Music")

func _ready():
	$Score/ScoreText.text = "Score: "+str(globalRef.level2MiniScore)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$Score.visible = false
	$Start.visible = true
	$HowTo.visible = true
	$endLevelButton.visible = false

func _physics_process(_delta):
	$Score/ScoreText.text = "Score: "+str(globalRef.level2MiniScore)
	if Input.is_action_just_pressed("Interact"):
		start()
	if globalRef.level2MinigameDoneFlag == 3:
		$endLevelButton.visible = true
	else:
		$endLevelButton.visible = false

func start():
	$Start.visible = false
	$HowTo.visible = false
	$Score.visible = true
	$endLevelButton.visible = false
	globalRef.achievementMiniGame = 0
	globalRef.level2MiniStart = true

func _on_end_level_button_pressed():
	globalRef.level2MiniStart = false
	globalRef.level2MinigameDoneFlag = 0
	musicRef.play_song_quiz()
	get_tree().change_scene_to_file("res://Assets/Level Scenes/Level 2/level_2_c.tscn")

func _on_dismiss_area_area_entered(area):
	if area.is_in_group("Water-B") or area.is_in_group("Water-G") or area.is_in_group("Water-Y"):
		area.queue_free()
