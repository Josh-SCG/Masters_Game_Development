extends KinematicBody2D

#Variables
const MAX_SPEED = 73
const ACCELERATION = 500
const FRICTION = 500

var velocity = Vector2.ZERO

var Char1 = preload("res://Assets/Player//Char1.png")
var Char2 = preload("res://Assets/Player//Char2.png")
var Char3 = preload("res://Assets/Player//Char3.png")
var Char4 = preload("res://Assets/Player//Char4.png")
var Char5 = preload("res://Assets/Player//Char5.png")
var Char6 = preload("res://Assets/Player//Char6.png")

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

#Functions
func _physics_process(delta): #up is negative, reversed in games; strange i forgot this :p -> had the comment [A,D],[W,S] = [-1,1]
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	#multiplying by delta makes it so the speed is tied to the games performance,; 
		#ie. game chugs the movement wont slow
		
	if input_vector != Vector2.ZERO:
		#Animation could work like "if input_vector.x >0: animationPlayer.play("RunRight") w/out AnimTree
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	if Input.is_key_pressed(KEY_1):
		var mysprite = get_node("Sprite")
		mysprite.set_texture(Char1)
	if Input.is_key_pressed(KEY_2):
		var mysprite = get_node("Sprite")
		mysprite.set_texture(Char2)
	if Input.is_key_pressed(KEY_3):
		var mysprite = get_node("Sprite")
		mysprite.set_texture(Char3)
	if Input.is_key_pressed(KEY_4):
		var mysprite = get_node("Sprite")
		mysprite.set_texture(Char4)
	if Input.is_key_pressed(KEY_5):
		var mysprite = get_node("Sprite")
		mysprite.set_texture(Char5)
	if Input.is_key_pressed(KEY_6):
		var mysprite = get_node("Sprite")
		mysprite.set_texture(Char6)
	
	velocity = move_and_slide(velocity)

