extends Node2D

@onready var globalRef = get_node("/root/Global")
@export var items : Array[PackedScene] = []

var randomItem = RandomNumberGenerator.new()
var selectedItem = 0


func _on_timer_timeout():
	if globalRef.level1MiniStart:
		randomItem.randomize()
		selectedItem = randomItem.randi_range(0,items.size()-1)
		var temp = items[selectedItem].instantiate()
		add_child(temp)
