extends KinematicBody2D

#Variables
const WALK_SPEED = 4.0
const TILE_SIZE = 16

var initialPosition = Vector2(0,0) 
var inputDirection = Vector2(0,0) 
var isMoving = false
var percentToNextTile = 0.0


onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

#Functions
func _ready():
	animationTree.active = true
	initialPosition = position
	

func _physics_process(delta): #up is negative, reversed in games; strange i forgot this :p -> had the comment [A,D],[W,S] = [-1,1]
	if isMoving == false:
		processPlayerInput()
	elif inputDirection != Vector2.ZERO:
		animationState.travel("Run")
		move(delta)
	else:
		animationState.travel("Idle")
		isMoving = false

func processPlayerInput():
	if inputDirection.y == 0:
		inputDirection.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	if inputDirection.x == 0:
		inputDirection.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	if inputDirection != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", inputDirection)
		animationTree.set("parameters/Run/blend_position", inputDirection)
		initialPosition = position
		isMoving = true
	else:
		animationState.travel("Idle")

func move(delta):
	percentToNextTile += WALK_SPEED * delta
	if percentToNextTile >= 1.0:
		position = initialPosition + (TILE_SIZE * inputDirection)
		percentToNextTile = 0.0
		isMoving = false
	else:
		position = initialPosition + (TILE_SIZE * inputDirection * percentToNextTile)


