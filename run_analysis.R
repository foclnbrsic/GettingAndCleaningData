#1. Merge the test and train data

testx <- read.table("X_test.txt")
testy <- read.table("Y_test.txt")
trainx <- read.table("X_train.txt")
trainy <- read.table("Y_train.txt")
test <- cbind(testx, testy)
train <- cbind(trainx, trainy)
names(test)[562] <- "Activity"
names(train)[562] <- "Activity"
all <- rbind(test, train)

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 

#Load the feature table (measurement names).
feature <- read.table("features.txt")

#Extract measurements with "mean" and "std".
mean_col <- all[,grep("mean", feature[,2])]
std_col <- all[,grep("std", feature[,2])]
res <- cbind(mean_col, std_col)

#3. Uses descriptive activity names to name the activities in the data set.

for (i in 1:nrow(all)) {
        if (all[i,562] == 1)
                all[i,562] <- "WALKING"
        else if (all[i,562] == 2)
                all[i,562] <- "WALKING_UPSTAIRS"
        else if (all[i,562] == 3)
                all[i,562] <- "WALKING_DOWNSTAIRS"
        else if (all[i,562] == 4)
                all[i,562] <- "SITTING"
        else if (all[i,562] == 5)
                all[i,562] <- "STANDING"
        else 
                all[i,562] <- "LAYING"
}

#4. Appropriately labels the data set with descriptive variable names. 

names(all)[1:561] <- as.character(feature[,2])

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Load the subject table

sub_test <- read.table("subject_test.txt")
sub_train <- read.table("subject_train.txt")
sub <- rbind(sub_test, sub_train)

#Append sub to all

all <- cbind(all, sub)
names(all)[563] <- "Subject"
as.factor(all[,563])

#Getting the mean values

res2 <- c()
for (i in 1 : 30) {
        temparr <- c()
        temp <- all[all$Subject==i,] #Subsetting according to Subject
        temparr <- c(names(tapply(temp[,1], temp$Activity, mean))) #Getting the activity names
        for (j in 1 : 561) #Calculate the mean values for each measurement
                temparr <- cbind(temparr, tapply(temp[,j], temp$Activity, mean)) 
        temparr <- cbind(rep(i, 6), temparr)
        res2 <- rbind(res2, temparr) #Add to one table
}