# A script to convert a set of 15 multiple choice questions into the needed format for the dialogue manager extension in Godot

'''
Required Files:
input.txt -> this holds the questions, formatting is no empty lines and question, 4 answers, explination if wrong answer selected
eg:
What is today?
 Monday
 Wednesday
 Friday
 Sunday
You can always check a calendar to find the correct day!
'''


#Just a way to cycle between answer keys
def changeAns(ans):
    if ans == 'a':
        return 'b'
    if ans == 'b':
        return 'c'
    if ans == 'c':
        return 'd'
    if ans == 'd':
        return 'a'


# initial variables
input = open("input.txt", "r")
count = 15 #only needed for 15 questions, can be changed depending on how many are needed.
qNum = 1
qAns = 'a'

def questionsGodot():
    input = open("input.txt", "r")
    count = 15 #only needed for 15 questions, can be changed depending on how many are needed.
    qNum = 1
    qAns = 'a'
    with open('output.txt', 'w') as f:
        while count > 0:        
            #Grabbing the current question and related answers plus the explination
            question = input.readline()
            answer = input.readline()
            wrong1 = input.readline()
            wrong2 = input.readline()
            wrong3 = input.readline()
            explian = input.readline()

            #Placing the explination section before the question
            f.write("~ E"+str(qNum)+"\nDigibot: "+explian+"=> END\n\n")
            
            #For loop to create four variations of the answers for each question placing the correct answer in each slot (total variations possible would be 24)
            for i in range(0,4):
                #Set question id (eg ~ Q1a) and start dialogue line (Dialogue is formatted as "Name: text text")
                f.write("~ Q"+str(qNum)+str(qAns)+"\nDigibot: ")
                f.write(question)
                if qAns == 'a':
                    #When allowing responses from the user it is formatted like:
                    '''
                    Character: Make a choice.
                    - Option 1
                    - Option 2
                    '''
                    f.write("- "+answer)
                    f.write("\tdo Global.testScore +=1\n") #Specific to my needs of tracking correct answers
                    f.write("\tDigibot: [[Correct|That is right|Well done]]!\n\t=> END\n") 
                    f.write("- "+wrong1)
                    f.write("\t =>< E"+str(qNum)+"\n") #Points to explination id for question and once completed returns to question
                    f.write("- "+wrong2)
                    f.write("\t =>< E"+str(qNum)+"\n")
                    f.write("- "+wrong3)
                    f.write("\t =>< E"+str(qNum)+"\n")
                if qAns == 'b':
                    f.write("- "+wrong1)
                    f.write("\t =>< E"+str(qNum)+"\n")
                    f.write("- "+answer)
                    f.write("\tdo Global.testScore +=1\n")
                    f.write("\tDigibot: [[Correct|That is right|Well done]]!\n\t=> END\n") 
                    f.write("- "+wrong2)
                    f.write("\t =>< E"+str(qNum)+"\n")
                    f.write("- "+wrong3)
                    f.write("\t =>< E"+str(qNum)+"\n")
                if qAns == 'c':
                    f.write("- "+wrong1)
                    f.write("\t =>< E"+str(qNum)+"\n")
                    f.write("- "+wrong2)
                    f.write("\t =>< E"+str(qNum)+"\n")
                    f.write("- "+answer)
                    f.write("\tdo Global.testScore +=1\n")
                    f.write("\tDigibot: [[Correct|That is right|Well done]]!\n\t=> END\n") 
                    f.write("- "+wrong3)
                    f.write("\t =>< E"+str(qNum)+"\n")
                if qAns == 'd':
                    f.write("- "+wrong1)
                    f.write("\t =>< E"+str(qNum)+"\n")
                    f.write("- "+wrong2)
                    f.write("\t =>< E"+str(qNum)+"\n")
                    f.write("- "+wrong3)
                    f.write("\t =>< E"+str(qNum)+"\n")
                    f.write("- "+answer)
                    f.write("\tdo Global.testScore +=1\n")
                    f.write("\tDigibot: [[Correct|That is right|Well done]]!\n\t=> END\n") 
                
                #cycle answer key to do next variation
                qAns = changeAns(qAns)
                #End the question
                f.write("=> END\n\n")
            f.write("\n")
            qNum += 1
            count -=1


def questionsWord():
    input = open("input.txt", "r")
    count = 15 #only needed for 15 questions, can be changed depending on how many are needed.
    qNum = 1
    qAns = 'a'
    with open('output2.txt', 'w') as f:
        while count > 0:        
            #Grabbing the current question and related answers plus the explination
            question = input.readline()
            answer = input.readline()
            wrong1 = input.readline()
            wrong2 = input.readline()
            wrong3 = input.readline()
            explian = input.readline()

            #Set question id (eg ~ Q1a) and start dialogue line (Dialogue is formatted as "Name: text text")
            f.write("Question "+str(qNum)+": \n")
            f.write(question)
            f.write("(i) "+answer)
            f.write("(ii) "+wrong1)
            f.write("(iii) "+wrong2)
            f.write("(iv) "+wrong3)
            #Placing the explination section before the question
            f.write("If incorrect: "+explian+"\n")

            qNum += 1
            count -=1

def questionsLaTeX():
    input = open("input.txt", "r")
    count = 15 #only needed for 15 questions, can be changed depending on how many are needed.
    qNum = 1
    qAns = 'a'
    with open('output3.txt', 'w') as f:
        while count > 0:        
            #Grabbing the current question and related answers plus the explination
            question = input.readline()
            answer = input.readline()
            wrong1 = input.readline()
            wrong2 = input.readline()
            wrong3 = input.readline()
            explian = input.readline()

            #Set question id (eg ~ Q1a) and start dialogue line (Dialogue is formatted as "Name: text text")
            f.write("Question "+str(qNum)+": \\\\")
            f.write(question)
            f.write("\\\\ (a) "+answer)
            f.write("\\\\ (b) "+wrong1)
            f.write("\\\\ (c) "+wrong2)
            f.write("\\\\ (d) "+wrong3)
            #Placing the explination section before the question
            f.write("\\\\ \\textbf{If incorrect:} "+explian+"\\\\\\\\")

            qNum += 1
            count -=1

questionsLaTeX()