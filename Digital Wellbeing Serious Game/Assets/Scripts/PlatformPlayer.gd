extends CharacterBody2D

const GRAVITY =  20 
const MAX_FALL_SPEED = 400
const ACCELERATION = 8
const JUMP_FORCE = 600

@onready var globalRef = get_node("/root/Global")
@export var PausePopUp:PackedScene
var popUp = null

var start = false

var is_jumping = false
@onready var animation = $Sprite2D/AnimationPlayer

var movementVector = Vector2.ZERO

func _ready():
	$Sprite2D.texture = load(globalRef.spriteSheetRef)

func startFunc():
	start = true
	animation.play("Walk")

func _physics_process(_delta):
	if start:
		movement()
		pauseGame()

func movement():
	velocity.y += GRAVITY #Always pushes player down
	if velocity.y > MAX_FALL_SPEED: #Clamp the max fall speed
		velocity.y = MAX_FALL_SPEED
	
	if is_jumping && velocity.y >= 0:
		is_jumping = false
	
	else:
		if is_on_floor():
			velocity.x = lerp(velocity.x,0.0,0.2)
			animation.play("Walk")
	
	if is_on_floor():
		if Input.is_action_just_pressed("Jump"):
			is_jumping = true
			velocity.y = -JUMP_FORCE
		
	if !is_on_floor():
		animation.pause()
	move_and_slide()

func pauseGame(): #Needs popup as unpause process can't happen if game paused; maybe make own sceene
	if Input.is_action_just_pressed("Pause"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		popUp = PausePopUp.instantiate()
		add_child(popUp)
		get_tree().paused = true
