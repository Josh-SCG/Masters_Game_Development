extends Node2D

@export var NPC_Dialogue:DialogueResource
@export var dialogue_window:PackedScene
@export var Balloon: PackedScene
@export var SmallBalloon: PackedScene
@export var startPoint = "start"
var window = null
var line = {}


func _ready():
	DialogueManager.dialogue_finished.connect(_on_dialogue_finished)
	
	await get_tree().create_timer(0.4).timeout


func show_dialogue(resource, key) -> void:
	assert(resource != null, "\"dialogue_resource\" property needs a to point to a DialogueResource.")
	
	#var is_small_window: bool = ProjectSettings.get_setting("display/window/size/viewport_width") < 400
	#var balloon: Node = (SmallBalloon if is_small_window else Balloon).instantiate()
	var balloon: Node = Balloon.instantiate()
	add_child(balloon)
	balloon.start(resource, key)

func setDialogue(resource, StartPoint):
	window = dialogue_window.instantiate()
	add_child(window)
	window.startDialogue(resource, StartPoint)

func _on_dialogue_finished():
	for child in get_children():
		child.queue_free()
