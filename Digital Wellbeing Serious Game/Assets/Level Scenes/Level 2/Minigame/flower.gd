extends Sprite2D

@onready var globalRef = get_node("/root/Global")

var dragged = false
var positionOffset = Vector2(0,0)
@export var flower : int #1b, 2g, 3y
@onready var flowerColour = $flowerColour

#Flower sprite frames as follows:
#	1	2	3	4
#B	4	7	1	43
#G	18	21	15	57
#Y	17	20	14	56
var flowerStage = 1

func _ready():
	if flower == 1:
		add_to_group("Water-B")
		flowerColour.set_frame(4)
	elif flower == 2:
		add_to_group("Water-G")
		flowerColour.set_frame(18)
	elif flower == 3:
		add_to_group("Water-Y")
		flowerColour.set_frame(17)

func _on_flower_area_area_entered(area):
	if area.get_groups() == self.get_groups():
		area.queue_free()
		globalRef.level2MiniScore += 1
		if area.is_in_group("Water-B"):
			if flowerStage == 1:
				flowerStage = 2
				flowerColour.set_frame(7)
			elif flowerStage == 2:
				flowerStage = 3
				flowerColour.set_frame(1)
			elif flowerStage == 3:
				flowerStage = 4
				globalRef.level2MinigameDoneFlag += 1
				flowerColour.set_frame(43)
		elif area.is_in_group("Water-G"):
			if flowerStage == 1:
				flowerStage = 2
				flowerColour.set_frame(21)
			elif flowerStage == 2:
				flowerStage = 3
				flowerColour.set_frame(15)
			elif flowerStage == 3:
				flowerStage = 4
				globalRef.level2MinigameDoneFlag += 1
				flowerColour.set_frame(57)
		elif area.is_in_group("Water-Y"):
			if flowerStage == 1:
				flowerStage = 2
				flowerColour.set_frame(20)
			elif flowerStage == 2:
				flowerStage = 3
				flowerColour.set_frame(14)
			elif flowerStage == 3:
				flowerStage = 4
				globalRef.level2MinigameDoneFlag += 1
				flowerColour.set_frame(56)
		
	elif area.get_groups() != self.get_groups():
		area.queue_free()
		if self.is_in_group("Water-B"):
			if flowerStage == 2:
				flowerStage = 1
				flowerColour.set_frame(4)
			elif flowerStage == 3:
				flowerStage = 2
				flowerColour.set_frame(7)
			elif flowerStage == 4:
				flowerStage = 3
				globalRef.level2MinigameDoneFlag -= 1
				flowerColour.set_frame(1)
		elif self.is_in_group("Water-G"):
			if flowerStage == 2:
				flowerStage = 1
				flowerColour.set_frame(18)
			elif flowerStage == 3:
				flowerStage = 2
				flowerColour.set_frame(21)
			elif flowerStage == 4:
				flowerStage = 3
				globalRef.level2MinigameDoneFlag -= 1
				flowerColour.set_frame(15)
		elif self.is_in_group("Water-Y"):
			if flowerStage == 2:
				flowerStage = 1
				flowerColour.set_frame(17)
			elif flowerStage == 3:
				flowerStage = 2
				flowerColour.set_frame(20)
			elif flowerStage == 4:
				flowerStage = 3
				globalRef.level2MinigameDoneFlag -= 1
				flowerColour.set_frame(14)
		if globalRef.level2MiniScore > 0:
			globalRef.level2MiniScore -= 1
