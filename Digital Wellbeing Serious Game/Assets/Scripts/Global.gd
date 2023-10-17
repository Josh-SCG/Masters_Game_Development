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

#level 2 - mental
var levelComplete2 = 0
var level2Score1 = 0
var level2Score2 = 0
var level2Score3 = 0

#level 3 - Security
var levelComplete3 = 0
var level3Score1 = 0
var level3Score2 = 0
var level3Score3 = 0

###############
#Level  Scores#
###############
var testScore = 0

var level1HighScore = 0
var level2HighScore = 0
var level3HighScore = 0

var level1SessionScore = 0
var level2SessionScore = 0
var level3SessionScore = 0

####################
#Question Selection#
####################
#Pool of x questions as in a dialogue file, chooseQuestions selects the numbers and answer orientation
#returns this to the dialogue which processes based of a if-else tree;
#i.e.  (if questionSelected == "phys5a": =>phys5a) 

var numPoolTest = [1,2,3]#,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
var numPool = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
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
