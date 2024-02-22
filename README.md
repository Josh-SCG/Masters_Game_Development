# Masters_Game_Development
 This repository houses the game that is being developed as a part of my Master's studies.
 
 # What is the goal of this game?
 The intentions behind the development of this game is to create a serious game, or a game for health and behavioural change, that will teach users about digital wellbeing. The main hope is that with a better understanding of digital wellbeing, users/players will be able to be more aware of their relationship with technology and improve it if needed. 
 
 # What is Digital Wellbeing?
This game will be using a self set definition of digital wellbeing based off of research conducted [here](https://github.com/Josh-SCG/Masters_Research_Project). The definition, as such, is thus: 

*Digital Wellbeing encompass an individual’s ability to foster healthy usage of technological devices and includes being able to protect said devices, privacy as well as their own physical and mental health.*

With this definition in mind, this game will focus on the education of a person's physical wellbeing, mental wellbeing and security with regards to technology.
 
 # Design principles and philosophies 
 As mentioned, this game is developed along side some research. For the specific principles followed, the first few can be found in an article written for CELDA 2022 [here](https://www.researchgate.net/publication/365301760_Linking_gamification_ludology_and_pedagogy_Principles_to_design_a_serious_game). Additional principles are also being reserched and as such will be found in the accomanying [research repository](https://github.com/Josh-SCG/Masters_Research_Project).
 
 # Design and Development checklist:
 - [x] Decide on a game engine to make use of
 - [x] Concuct research into what type of game to make (i.e. 2D vs 3D, PC vs Mobile, etc.)
 - [x] Decide what aspects of digital wellbeing will be taught
 - [x] Construct a "skeleton" of basic features
 - [x] Develop a prototype level
 - [x] Design and develop the "fun" aspects of the game
 - [x] Finalise the game with all the required levels

# Automation of the quiz
For the quiz sections of the game, I decided it would be a good thing to have the answers change locations so that each playthrough still requires focus. However, the dialgue manager does not have an option for this, or at least the version I was using did not since at time of writting I'm behind like 3 major versions and likely dozens of updates.

Anyway, once I finished writting the questions and answers, I did not want to spend hours manually changing 135 answer locations (3 quizzes with 15 questions and 4 answers each minus the origional 15 in each quiz) so I wrote a script to take in the questions and then both format and create the variations I needed.

This is a very specific script and I doubt it will be needed by any but maybe it will one day. [Here](https://github.com/Josh-SCG/Masters_Game_Development/blob/main/Question%20Variation%20Automation/variate_the_questions.py) it is if you need it.
