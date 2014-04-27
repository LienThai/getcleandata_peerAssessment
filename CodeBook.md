a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

Code Book: Getting Cleaning Data Peer Assessment
Name: Lien Thi Thai

1) Description of Variables
First variable is "Subject" - which is the person who's carrying out the activities; in this dataset there are 30 subjects (i.e. volunteers)
Second variable is "Activity Type"- which is the type of activity that the subject carrys out; there are 6 types of activities; there are labelled as below: so 1 for walking, 2 for walking upstair etc.
	1 WALKING
	2 WALKING_UPSTAIRS
	3 WALKING_DOWNSTAIRS
	4 SITTING
	5 STANDING
	6 LAYING
The remaining variables are variables that are computed from taking the mean of these variables (any variables with mean and standard deviation) based on the subject and activity type.



2)The Data
The Data itself contains 86 variables and 180 observations; There should be 88 variables (before i apply the melt()), but however i noticed that when i applied the melt() it somehow reduced down to 86 variables.



3) Procedure/Performance

