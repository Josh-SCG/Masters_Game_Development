extends CharacterBody2D

#Variables
const MAX_SPEED = 85
const ACCELERATION = 500
const FRICTION = 750

#var velocity = Vector2.ZERO

@onready var animationPlayer = $AnimationPlayer
@onready var animationTree = $AnimationTree
@onready var rayCast = $InteractRayCast
@onready var sprite = $Sprite
@onready var animationState = animationTree.get("parameters/playback")
@onready var globalRef = get_node("/root/Global")

#Functions
func _ready():
	sprite.texture = load(globalRef.spriteSheetRef)
	animationTree.active = true
	rayCast.rotation_degrees = 90

func _physics_process(delta): #up is negative, reversed in games; strange i forgot this :p -> had the comment [A,D],[W,S] = [-1,1]
	movement(delta)
	rayCastDir(delta)
	if Input.is_action_just_pressed("Interact"):
		interact(delta)

func rayCastDir(_delta):
	#Setting the direction of the raycast to the direction the player is facing
	if Input.is_action_pressed("ui_down"):
		rayCast.rotation_degrees = 0
	elif Input.is_action_pressed("ui_left"):
		rayCast.rotation_degrees = 90
	elif Input.is_action_pressed("ui_up"):
		rayCast.rotation_degrees = 180
	elif Input.is_action_pressed("ui_right"):
		rayCast.rotation_degrees = 270
	
	#print(rayCast.is_colliding())

func movement(delta):
	var input_vector = Vector2.ZERO
	
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")	
	
	
	#if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		#input_vector = get_global_mouse_position() - position
	
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
	
	move_and_slide()
	
func interact(_delta):
	if rayCast.is_colliding() == false:
		return
	var collidingObject = rayCast.get_collider()
	if collidingObject.is_in_group("NPC"):
		collidingObject.startDialogue()
