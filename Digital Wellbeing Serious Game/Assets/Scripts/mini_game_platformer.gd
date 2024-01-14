extends Node2D

@onready var globalRef = get_node("/root/Global")

func _ready():
	$Score/ScoreText.text = "Score: "+str(globalRef.level1MiniScore)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$Score.visible = false
	$VBoxContainer/Start.visible = true
	$VBoxContainer/HowTo.visible = true

func _physics_process(_delta):
	$Score/ScoreText.text = "Score: "+str(globalRef.level1MiniScore)
	if Input.is_action_just_pressed("Interact"):
		start()


func start():
	$VBoxContainer/Start.visible = false
	$VBoxContainer/HowTo.visible = false
	$Score.visible = true
	globalRef.achievementMiniGame = 0
	globalRef.level1MiniStart = true
	$PlatformPlayer.startFunc() 
