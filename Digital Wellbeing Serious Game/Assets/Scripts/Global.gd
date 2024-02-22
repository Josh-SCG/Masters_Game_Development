extends Node

###############################
#Character selection variables#
###############################
var gender = "M"
var skinTone = "W"
var outfit = "C"
var hairStyle = "L"
var hairColour = "D"

var spriteSheetRef = "res://Assets/Player//Player Sprites//"+gender+skinTone+outfit+hairStyle+hairColour+".png"

######################
#Level Menu variables#
######################

var currentLevel = 0

#level 1 - physical
var levelComplete1 = 0
var level1Score1 = 0
var level1Score2 = 0
var level1Score3 = 0

var level1Signs = [1,2,3,4,5]
var level1SignsSeen = 0

#level 2 - mental
var levelComplete2 = 0
var level2Score1 = 0
var level2Score2 = 0
var level2Score3 = 0

var level2Signs = [1,2,3,4,5]
var level2SignsSeen = 0

#level 3 - Security
var levelComplete3 = 0
var level3Score1 = 0
var level3Score2 = 0
var level3Score3 = 0

var level3Signs = [1,2,3,4,5]
var level3SignsSeen = 0

###############
#Level  Scores#
###############
var testScore = 0

var level1HighScore = 0
var level2HighScore = 0
var level3HighScore = 0

var level1MiniScore = 0
var level2MiniScore = 0
var level3MiniScore = 0

var level1MiniStart = false
var level2MiniStart = false
var level3MiniStart = false

var level1SessionScore = 0
var level2SessionScore = 0
var level3SessionScore = 0

var level2MinigameDoneFlag = 0
var level3FailState = 0

func setScores():
	if currentLevel == 1:
		level1SessionScore = testScore
		if level1SessionScore > level1HighScore:
			level1HighScore = level1SessionScore
		if level1HighScore == 10:
			achievementLevel100 = 0
			level1Score1 = 1
			level1Score2 = 1
			level1Score3 = 1
		elif level1HighScore < 10 && level1HighScore > 5:
			level1Score1 = 1
			level1Score2 = 1
		else:
			level1Score1 = 1

	elif currentLevel == 2:
		level2SessionScore = testScore
		if level2SessionScore > level2HighScore:
			level2HighScore = level2SessionScore
		if level2HighScore == 10:
			achievementLevel100 = 0
			level2Score1 = 1
			level2Score2 = 1
			level2Score3 = 1
		elif level2HighScore < 10 && level2HighScore > 5:
			level2Score1 = 1
			level2Score2 = 1
		else:
			level2Score1 = 1
	
	elif currentLevel == 3:
		level3SessionScore = testScore
		if level3SessionScore > level3HighScore:
			level3HighScore = level3SessionScore
		if level3HighScore == 10:
			achievementLevel100 = 0
			level3Score1 = 1
			level3Score2 = 1
			level3Score3 = 1
		elif level3HighScore < 10 && level3HighScore > 5:
			level3Score1 = 1
			level3Score2 = 1
		else:
			level3Score1 = 1

#######################
#Achievement Variables#
#######################

#These are flipped, with 1 being undone and 0 being done as the image file names use 0 as a filled sign and 1 as an empty one

var achievementLevelStart = 1
var achievementLevelFinish = 1
var achievementLevel100 = 1
var achievementSign = 1
var achievementMiniGame = 1

####################
## Other Variables##
####################

var initLevelConvo = 0
var signCheck = false

####################
#Question Selection#
####################
#Pool of x questions as in a dialogue file, chooseQuestions selects the numbers and answer orientation
#returns this to the dialogue which processes based of a if-else tree;
#i.e.  (if questionSelected == "phys5a": =>phys5a) 

var numPoolTest = [1,2,3]#,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
var numPool = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
var answerPool = ["a","b","c","d"]
var questionDict = {}
var qNum = 0
var qAns = ""
func chooseQuestions():
	numPool.shuffle()
	questionDict.clear()
	for i in range(0,10):
		var answerLoc = answerPool.pick_random()
		questionDict[numPool[i]] = answerLoc
	print(questionDict)
	
func chooseQuestionsTest():
	numPoolTest.shuffle()
	questionDict.clear()
	for i in range(0,3):
		var answerLoc = answerPool.pick_random()
		questionDict[numPool[i]] = answerLoc
	print(questionDict)

func setQuestion(num):
	var dictKeys = questionDict.keys()
	var questionKey = dictKeys[num-1]
	return questionKey

func setAnswer(key):
	var ansLetter = questionDict[key]
	return ansLetter

####################
## Misc Functions ##
####################
#These functions are used to help with dialogue about a players progress with regards to how many signs are left
func signRemoval(levelArray, signNum) -> bool:
	var i = levelArray.find(signNum)
	if i != -1:
		levelArray.remove_at(i)
		return true
	return false

func arrayReset(array):
	array.clear()
	var temp = [1,2,3,4,5]
	array.append_array(temp)

#Reset the scores and completion of the player if they leave the level with pause menu
func resetLevelProgress():
	signCheck = false
	initLevelConvo = 0
	testScore = 0
	
	if currentLevel == 1:
		level1SessionScore = 0
		level1MiniScore = 0
		level1SignsSeen = 0
		arrayReset(level1Signs)

	elif currentLevel == 2:
		level2SessionScore = 0
		level2MiniScore = 0
		level2SignsSeen = 0
		arrayReset(level2Signs)
	
	elif currentLevel == 3:
		level3SessionScore = 0
		level3MiniScore = 0
		level3SignsSeen = 0
		arrayReset(level3Signs)
	
	currentLevel = 0


var randHint = 0
func randomHint(array) -> int:
	return array.pick_random()
	
