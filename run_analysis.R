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

# describe activities
testActivity <- merge(testActivity, activities, by = 1, sort = FALSE)
trainActivity <- merge(trainActivity, activities, by = 1, sort = FALSE)

# combine data with subject and activity
test <- cbind(testSubject, testActivity[, 2], testData[, columns])
train <- cbind(trainSubject, trainActivity[, 2], trainData[, columns])

# name variables
names(test) <- c("Subject", "Activity", features[, 2][columns])
names(train) <- c("Subject", "Activity", features[, 2][columns])

# combine sets
dataMerge <- rbind(test, train)

# summarize data
library(reshape2)
dataMelt <- melt(merge, id = c("Subject", "Activity"),
             measure.vars = features[,2][columns])

dataset <- dcast(dataMelt, Subject + Activity ~ variable, mean)

# write file
write.table(dataset, file = "tidydataset.txt", row.names = FALSE)
