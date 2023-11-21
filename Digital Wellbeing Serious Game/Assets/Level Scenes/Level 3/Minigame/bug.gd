extends Node2D

@export var speed = 8
@onready var globalRef = get_node("/root/Global")

var dir = Vector2(0,0)

func _physics_process(_delta):
	move()

func move():
	position.x -= dir.x
	position.y -= dir.y
