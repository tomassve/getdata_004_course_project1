# Course project no 1 in "Getting and Cleaning Data" 
#
# Prerequisite:
#
#   1) Install reshape2
#   2) Set working directory to the directory of this R-script
#   3) Download and unpack data set into "./UCI HAR Dataset"
#
# Result table is outputted to "myTidyDataTable.csv"



# Load libraries
library(reshape2)

# Read activity and feature labels
activityLabs <- read.csv("./UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
colnames(activityLabs) <- c("id", "activity")
features <- read.csv("./UCI HAR Dataset/features.txt", sep="", header=FALSE)
colnames(features) <- c("id", "features")

# -----------------------------------------------------------------------------
# Read test set ...
# -----------------------------------------------------------------------------

#   ... activity first 
testy <- read.csv("./UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE)
colnames(testy) <- "activityid"

#   ... then subject 
test_subject <- read.csv("./UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)
colnames(test_subject) <- "subject"

#   ... and at last feature data
testX <- read.csv("./UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
colnames(testX) <- features[,2]
# Keep features with mean and std
testX <- testX[,grep("(mean|std)\\(\\)", features[,2])]
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Read train set ...
# -----------------------------------------------------------------------------
#   ... activity first 
trainy <- read.csv("./UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE)
colnames(trainy) <- "activityid"

#   ... then subject 
train_subject <- read.csv("./UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
colnames(train_subject) <- "subject"

#   ... and at last feature data
trainX<-read.csv("./UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
colnames(trainX)<- features[,2]
# Keep features with mean and std
trainX <- trainX[,grep("(mean|std)\\(\\)", features[,2])]

# -----------------------------------------------------------------------------
# Compile merged data set
# -----------------------------------------------------------------------------
data <- cbind(test_subject, origin = "testset", 
              activity = activityLabs$activity[testy$activityid], testX)
data <- rbind(data,
              cbind(train_subject, origin = "trainset", 
                    activity = activityLabs$activity[trainy$activityid], trainX))
data$subject <- as.factor(data$subject)
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Reshape, average and save data
meltedData <- melt(data=data, id.vars=c("subject", "activity", "origin"))
myTidyDataTable <- dcast(meltedData, subject + activity ~ variable , mean)
labelsToChange <- grep("(mean|std)\\(\\)", colnames(myTidyDataTable))
colnames(myTidyDataTable)[labelsToChange] <- paste("avg", colnames(myTidyDataTable)[labelsToChange], sep="_")
# -----------------------------------------------------------------------------

# Save to file
write.table(myTidyDataTable, file = "myTidyDataTable.txt")
# -----------------------------------------------------------------------------

# Done. Clean up
rm(list=c("activityLabs", "features", "test_subject", "testX", "testy", "train_subject", "trainX", 
          "trainy", "meltedData", "data", "labelsToChange"))
