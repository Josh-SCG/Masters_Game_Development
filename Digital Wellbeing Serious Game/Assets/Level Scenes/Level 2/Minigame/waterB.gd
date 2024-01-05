extends Area2D

var dragged = false
var positionOffset = Vector2(0,0)
var colourPool = [1,2,3] #1b, 2g, 3y
@onready var blue = $waterB
@onready var green = $waterG
@onready var yellow = $waterY

func _ready():
	colourPool.shuffle()
	var colourNum = colourPool.pick_random()
	if colourNum == 1:
		add_to_group("Water-B")
		blue.visible = true
		green.visible = false
		yellow.visible = false
	elif colourNum == 2:
		add_to_group("Water-G")
		blue.visible = false
		green.visible = true
		yellow.visible = false
	elif colourNum == 3:
		add_to_group("Water-Y")
		blue.visible = false
		green.visible = false
		yellow.visible = true

func _process(delta):
	if dragged:
		position = get_global_mouse_position() - positionOffset - Vector2(890,-40)
	else:
		position = position + Vector2(0,1)

func _on_button_button_down():
	dragged = true
	positionOffset = get_global_mouse_position() - global_position 

func _on_button_button_up():
	dragged = false
