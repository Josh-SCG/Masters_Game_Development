extends TextureRect

@export var diologPath = ""
@export var path = ""
@export var textSpeed = 0.05

var diologue
var phraseNum = 0
var finished = false

func _ready():
	$Timer.wait_time = textSpeed
	diologue = getDiologue()
	assert(diologue, "Diologue not found")
	nextPhrase()
	
func _process(_delta):
	$Indicator.visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		if finished:
			nextPhrase()
		else:
			$Text.visible_characters = len($Text.text)

func getDiologue() -> Array:
	var file = FileAccess.open(diologPath,FileAccess.READ)
	assert(file.file_exists(diologPath), "File Path Invalid")
	
	file.open(diologPath, FileAccess.READ)
	var json = file.get_as_text()
	
	var output = JSON.parse_string(json)
	
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []
		
func nextPhrase() -> void:
	if phraseNum >= len(diologue):
		queue_free()
		return
	
	finished = false
	
	$Name.bbcode_text = diologue[phraseNum]["Name"]
	$Text.bbcode_text = diologue[phraseNum]["Text"]
	
	$Text.visible_characters = 0
	
	var file = FileAccess.open(diologPath,FileAccess.READ)
	var img = path + diologue[phraseNum]["Name"] + diologue[phraseNum]["Emotion"] + ".png"
	if file.file_exists(img):
		$Portrait.texture = load(img)
	else:
		$Portrait.texture = null
	
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1
		
		$Timer.start()
		await $Timer.timeout
		
	finished = true
	phraseNum += 1
	return
		
