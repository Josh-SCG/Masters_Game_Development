extends CanvasLayer

@onready var globalRef = get_node("/root/Global")

func _on_un_pause_pressed():
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	self.queue_free()


func _on_menu_pressed():
	get_tree().paused = false
	globalRef.resetLevelProgress()
	get_tree().change_scene_to_file("res://Assets/Menu Scenes/Main Menu.tscn")
