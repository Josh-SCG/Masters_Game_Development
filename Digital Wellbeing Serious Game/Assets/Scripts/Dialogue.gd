extends CanvasLayer

var dialogueResource: DialogueResource
var dialogueLine = {}

@onready var speaker =$BackgroundRect/MarginContainer/VBoxContainer/Speaker
@onready var dialogueBackground = $BackgroundRect
@onready var marginCont = $BackgroundRect/MarginContainer
@onready var dialogueText = $BackgroundRect/MarginContainer/VBoxContainer/Text
@onready var optionList = $BackgroundRect/MarginContainer/VBoxContainer/Options
@onready var optionButton = $OptionButton

var waitChoice = false
var totalCharacters = 0
var printingDialogue = false
var charactersPrinted = 0 
var yScale = 0
@export var PRINT_SPEED = 50


func _ready():
	DialogueManager.dialogue_finished.connect(endDialogue)

func _process(delta):
	if Input.is_action_just_pressed("Interact"):
		if printingDialogue == false:
			if waitChoice == false:
				getNextDialogue(dialogueLine.next_id)
			else:
				var firstOption = dialogueLine.responses[0].next_id
				getNextDialogue(firstOption)
	
	processDialogueWindow(delta)
	interaction(delta)

func interaction(_delta):
	if not waitChoice: return
	if dialogueLine.responses.size() > 0: return
	
	if Input.is_action_pressed("dialogueInteract"):
		dialogueLine = await dialogueResource.get_next_dialogue_line(dialogueLine.next_id)

func processDialogueWindow(delta):
	if charactersPrinted < totalCharacters:
		charactersPrinted += PRINT_SPEED * delta
		dialogueText.visible_characters = charactersPrinted
	else:
		printingDialogue = false

func startDialogue(dialogue, _startPoint):
	dialogueResource = dialogue
	dialogueLine = await DialogueManager.get_next_dialogue_line(dialogue)
	updateDialogueWindow()

func getNextDialogue(next_id):
	dialogueLine = await DialogueManager.get_next_dialogue_line(dialogueResource, next_id)
	updateDialogueWindow()

func endDialogue():
	queue_free()

func updateDialogueWindow():
	yScale = 0
	if DialogueManager.is_valid(dialogueLine) == false:
		return
	
	speaker.text = dialogueLine.character
	dialogueText.text = dialogueLine.text
	yScale += speaker.get_content_height()
	yScale += dialogueText.get_content_height()
	
	clearOptions()
	setOptions()
	
	totalCharacters = dialogueText.get_total_character_count()
	dialogueText.visible_characters = 0
	charactersPrinted = 0
	printingDialogue = true
	

func clearOptions():
	for child in optionList.get_children():
		child.queue_free()

func setOptions():
	if dialogueLine.responses.size()>0:
		waitChoice = true
	else:
		waitChoice = false
	
	var options = dialogueLine.responses
	
	for i in options.size():
		var option = optionButton.duplicate()
		optionList.add_child(option)
		option.show()
		option.text = options[i].text
		setResponseAction(option, options[i].next_id)
		if i == 0:
			option.grab_focus()
	
	yScale += optionList.size.y
	#dialogueBackground.size.y = yScale

func setResponseAction(optionsButton, next_id):
	optionsButton.pressed.connect(getNextDialogue.bind(next_id))


