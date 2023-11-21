extends Node2D

@onready var globalRef = get_node("/root/Global")
var wallStage = 3

func damage():
	if wallStage == 3:
		$"3".visible = false
		wallStage -= 1
	elif wallStage == 2:
		$"2".visible = false
		wallStage -= 1
	elif wallStage == 1:
		$"1".visible = false
		wallStage -= 1
		$CollisionShape2D.set_deferred("disabled", true)
		globalRef.level3FailState += 1
	else:
		pass
