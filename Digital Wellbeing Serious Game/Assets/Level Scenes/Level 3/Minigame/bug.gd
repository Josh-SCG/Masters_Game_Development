extends Node2D

@onready var globalRef = get_node("/root/Global")

var dir = Vector2(0,0)
var alive = true

func _physics_process(_delta):
	if alive:
		move()

func move():
	position.x -= 1.5*dir.x
	position.y -= 1.5*dir.y

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
		alive = false
		globalRef.level3MiniScore += 1
		self.queue_free()


func _on_area_2d_body_entered(body):
	body.damage()
	self.queue_free()
