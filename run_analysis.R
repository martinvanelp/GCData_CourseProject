##
## Getting and Cleaning Data: Course project
## Goal: create tidy data set from accelerometer data
##

#  fetch data
if (!file.exists("accelerometer.zip")) { 
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, destfile = "./accelerometer.zip")
}

unzip("./accelerometer.zip")

# loading sets
features <- read.table("./UCI HAR Dataset/features.txt", as.is = 2)
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testActivity <- read.table("./UCI HAR Dataset/test/y_test.txt")
testData <- read.table("./UCI HAR Dataset/test/X_test.txt")

trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trainActivity <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")

# select relevant columns
columns <- sort(c(grep("mean()", features[,2], fixed = TRUE), 
                  grep("std()", features[,2], fixed = TRUE)))

# combine data with subject and activity
test <- cbind(testSubject, testActivity, testData[, columns])
train <- cbind(trainSubject, trainActivity, trainData[, columns])

# combine sets
dataMerge <- rbind(test, train)

# name variables
names(dataMerge) <- c("Subject", "Activity", features[,2][columns])

# describe activities
dataMerge$Activity = factor(dataMerge$Activity, labels = activities[,2])

# summarize data
library(reshape2)
dataMelt <- melt(dataMerge, id = c("Subject", "Activity"),
             measure.vars = features[,2][columns])

dataset <- dcast(dataMelt, Subject + Activity ~ variable, mean)

# write file
write.table(dataset, file = "tidydataset.txt", row.names = FALSE)
