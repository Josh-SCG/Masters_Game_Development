extends CanvasLayer

@onready var globalRef = get_node("/root/Global")

func _on_un_pause_pressed():
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	self.queue_free()


func _on_menu_pressed():
	get_tree().paused = false
	
	#Grab current level number and reset the scores and completion of the player if they leave the level with pause menu
	var level = globalRef.currentLevel
	if level == 1:
		globalRef.level1Score1 = 0
		globalRef.level1Score2 = 0
		globalRef.level1Score3 = 0
		globalRef.level1SessionScore = 0

	elif level == 2:
		globalRef.level2Score1 = 0
		globalRef.level2Score2 = 0
		globalRef.level2Score3 = 0
		globalRef.level2SessionScore = 0
	
	elif level == 3:
		globalRef.level3Score1 = 0
		globalRef.level3Score2 = 0
		globalRef.level3Score3 = 0
		globalRef.level3SessionScore = 0
	
	get_tree().change_scene_to_file("res://Assets/Menu Scenes/Main Menu.tscn")
