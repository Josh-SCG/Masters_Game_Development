extends Node2D

@onready var FM1 = $FM1
@onready var FM2 = $FM2
@onready var DP1 = $DP1
@onready var DP2 = $DP2

var motion = Vector2()
var trigger1 = false
var trigger2 = false
var start = false

func _physics_process(delta):
	if Input.is_action_pressed("Pause"):
		start = true
	
	if start:
		FM1.velocity.x = 75
		FM1.move_and_slide()

	if trigger1:
		FM2.velocity.x = -100
		FM2.move_and_slide()
	
	if trigger2:
		DP1.velocity.x = -120
		DP1.move_and_slide()
		DP2.velocity.x = -120
		DP2.move_and_slide()
	

func _on_area_2d_2_area_entered(area):
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	trigger1 = true


func _on_area_2d_2_body_entered(body):
	trigger2 = true
