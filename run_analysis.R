###############################################################
##
## Getting and Cleaning Data Course Project - Week 4 Assignment
##
## Title: run_analysis.R
##
## Author: Lindsey Buckle
##
## Script version: 1.0
##
## -----------------------------------------------------------
##
## Load required libraries
library(plyr)
library(dplyr)
library(stringr)

## Code to load download data, if not already done. Uncomment if required.
# url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# destfile <- "dataset.zip"
# download.file(url, destfile, method="curl")
# unzip(destfile)

## ------------------------------------------------------------
## Read in the required files
##
baseFolder <- "./UCI HAR Dataset"

## Read in feature names and activity labels
file <- paste0(baseFolder, "/features.txt")
features <- read.table(file = file, stringsAsFactors = FALSE)
file <- paste0(baseFolder, "/activity_labels.txt")
activities <- read.table(file = file, stringsAsFactors = FALSE)

## Read the required files for test data set
file <- paste0(baseFolder, "/test/X_test.txt")
testData <- read.table(file = file)

## Read in Activity labels, setting column name to Activity
file <- paste0(baseFolder, "/test/y_test.txt")
testLabels <- read.table(file = file, col.names = "Activity")

## Read in subject identifiers
file <- paste0(baseFolder, "/test/subject_test.txt")
testSubjects <- read.table(file = file, col.names = "SubjectId")


## Repeat for training data
file <- paste0(baseFolder, "/train/X_train.txt")
trainData <- read.table(file = file)
file <- paste0(baseFolder, "/train/y_train.txt")
trainLabels <- read.table(file = file, col.names = "Activity")
file <- paste0(baseFolder, "/train/subject_train.txt")
trainSubjects <- read.table(file = file, col.names = "SubjectId")

## -----------------------------------------------------------
## 4. Label the data set with descriptive variable names.
##    - Perform Step 4 before Step 2 so that we can extract relevant data based
##      upon column names
##    - Change the variable names before merging so that the columns in each
##      data frame match correctly
##    - Rename with the feature names listed in features.txt
colnames(testData) <- features[,2]
colnames(trainData) <- features[,2]

## -----------------------------------------------------------
## 1. Merge training and test sets:
##     - a) bind data with activity and subject for test
##     - b) bind data with activity and subject for training
##     - c) merge test and training data sets
##
testMerge <- data.frame(c(testSubjects, testLabels, testData))
trainMerge <- data.frame(c(trainSubjects, trainLabels, trainData))
allData <- rbind(testMerge, trainMerge)

## Tidy up - remove elements we don't need
remove(list=c("testSubjects", "testLabels", "testData", "trainSubjects", "trainLabels",
              "trainData", "testMerge", "trainMerge", "features"))

## -----------------------------------------------------------
## 2. Extract only the measurements on the mean and standard deviation 
##    for each measurement.
pattern <- "(m)ean[\\.|)]|(s)td\\."
finalSet <- select(allData, SubjectId, Activity, grep(pattern,names(allData)))

## ----------------------------------------------------------
## 4. Label the data set with descriptive variable names.
##    - Tidy the variable names up removing all "." and capitalizing M and S 
##      at the start of "mean" and "std"
       
tempNames <- gsub("\\.+", " ", names(finalSet))
tempNames <- str_trim(tempNames)
tempNames <- gsub("(^|\\s)(\\w)", "\\U\\2", tempNames, perl=TRUE)
colnames(finalSet) <- tempNames

## ----------------------------------------------------------
## 3. Use descriptive activity names in the data set
finalSet <- mutate(finalSet, Activity=activities[match(finalSet$Activity, activities$V1),2])

## ---------------------------------------------------------
## 5. Create a second, independent tidy data set with the 
##    average of each variable for each activity and each subject.
tidyData <- ddply(finalSet, .(SubjectId, Activity), function(x) colMeans(x[3:68]))

## Output this to a file
write.table(tidyData, file="HCI_HAR_Tidy_Avgs.txt", quote=FALSE, row.names=FALSE)

## Final clean up of environment
remove(list=c("allData", "activities", "tempNames", "finalSet", 
              "tidyData", "baseFolder","file","pattern"))