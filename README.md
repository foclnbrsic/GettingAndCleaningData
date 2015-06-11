# GettingAndCleaningData
Line 3~11: The first part of the code concatenate the test and train data into one data, "all". X and Y values are combined.
Line 16~21: Define the features by reading in feature.txt and extract the columns with "mean" or "std" in them.
Line 25~38: Rename the Activity Code into Activity Strings.
Line 42: Rename all the columns using the descriptive names read from features.txt
Line 48-50: Load the subject table.
Line 54-56: Append subjects column to all.
Line 60-68: First, a temp array is defined to hold the data for each subject in a for cycle; Second, temparr is created and the names of activities are appended to it; Third, the temparr variable is enlarged step by step by adding the mean values of each measurements to it. The distinguishing of each activity is realized by using tapply() functions; Fourth, the temparr variable, which holds the mean value of each measurement and each activity corresponding to one subject, is added to the res2 variable. Finally, the res2 variable represents the tidy data this project required.
