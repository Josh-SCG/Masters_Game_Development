extends Node2D

@onready var globalRef = get_node("/root/Global")
@export var water : PackedScene

func _on_timer_timeout():
	if globalRef.level2MiniStart:
		var waterSpawn = water.instantiate()
		add_child(waterSpawn)

