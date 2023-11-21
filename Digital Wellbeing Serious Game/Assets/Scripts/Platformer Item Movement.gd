extends Node2D

@export var speed = 8
@onready var globalRef = get_node("/root/Global")

func _physics_process(_delta):
	move()

func move():
	position.x -= speed

func _on_laptop_body_entered(_body):
	globalRef.level1MiniScore += 1
	self.queue_free()

func _on_sign_body_entered(_body):
	globalRef.level1MiniStart = false
	get_tree().change_scene_to_file("res://Assets/Level Scenes/Level 1/level_1_c.tscn")
