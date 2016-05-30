Getting and Cleaning Data Course Project
========================================

Week 4 Assignment
-----------------

This README accompanies the submission of the following for the purposes
of this assignment:

1.  A tidy data set
2.  A code book describing the variables and transformations
3.  A script that will allow you to arrive at the tidy set when
    following the instructions in this README.

### Introduction

This README includes the instructions to arrive at the tidy data set.

The original data set for this project can be downloaded from:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

(The original data source is available here:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>)

### Instructions

You can use the following code to download and unzip the files to your
working directory:

    # url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    # destfile <- "dataset.zip"
    # download.file(url, destfile, method="curl")
    # unzip(destfile)

To produce the tidy data download the run\_analysis.R script and load it
into R.

### What the script does

The downloaded data consists of a number of files which are explained in
the README.txt that is included in the zip file.

There are two datasets: training and test. Subjects were split into
these 2 categories, with 70% generating the training data and 30% the
test data.

For the purposes of this cleansing task the following files are read
into R:

<table>
<thead>
<tr class="header">
<th align="left">Filename</th>
<th align="left">Structure</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">features.txt</td>
<td align="left">561 obs. of 2 variables: V1: int; V2: chr</td>
<td align="left">This provides the variable names for the smartphone data columns. V2 directly relates to a column in the main data set and can be used to give meaningful names to the columns in the X_test/train.txt data.</td>
</tr>
<tr class="even">
<td align="left">activity_labels.txt</td>
<td align="left">6 obs of 2 variables: V1: int; V2: chr</td>
<td align="left">This is used to match against the activities in the data sets. V1 is an integer value displayed in y_test/train.txt. V2 is a meaningful name for this activity (e.g. WALKING)</td>
</tr>
<tr class="odd">
<td align="left">/test/X_test.txt</td>
<td align="left">2947 obs. of 561 variables; V1:V561: num</td>
<td align="left">This is the test data set, containing the smartphone values. The rows in this file correspond to a single observation. There is a one-to-one relationship between the columns and the V2 of features.txt. /train/X_train.txt has the same format with 7352 obs.</td>
</tr>
<tr class="even">
<td align="left">/train/y_train.txt</td>
<td align="left">2947 obs. of 1 variable; V1: int</td>
<td align="left">This contains the activity labels (integer). Each row corresponds to a single observation and there is a one-to-one relationship between the rows in this file and the rows in /test/X_test.txt but no direct reference between the two. The integer values in this file correspond with the integer values in activity_labels.txt and there is a one-to-many relationship. /test/y_test.txt has the same format with 7352 obs.</td>
</tr>
<tr class="odd">
<td align="left">/test/subject_test.txt</td>
<td align="left">2947 obs. of 1 variable; V1:int</td>
<td align="left">This lists the subject ids of the volunteers that each row in the test data set relates to. Each row in this file corresponds to a single observation and there is a one-to-one relationship with both /test/X_test.txt and /test/y_test.txt. The same format applies to /train/subject_train.txt with 7352 obs.</td>
</tr>
</tbody>
</table>

The script performs the following steps:

1.  Loads the libraries required for processing.
2.  Reads in the three files that correspond to the data set for both
    test and training, i.e. X, y and subject.
3.  Reads in the feature names and the activity labels.
4.  Sets the column names of the data sets to the feature names.
5.  Creates a merged data frame with columns for Activity and
    Subject\_ID added to the main (X) data set for both test and
    training.
6.  Merges the rows from the resultant data frames from step 5. so that
    all data is in one data frame.
7.  Creates a new data frame from the data frame created in step 6,
    containing Subject\_ID, Activity and all columns containing either
    mean or standard deviation data (identified by searching for
    variable names containing "mean" or "std").
8.  Tidies the variable names in the data set by removing all "." and
    capitalizing name sections (e.g. Mean). (e.g. tBodyAcc-mean()-X)
    becomes tBodyAcc.mean...X on loading into a data frame. After
    running the script it is TBodyAccMeanX)
9.  Use the data loaded from activity\_labels.txt to replace the
    integers in the Activity column with meaningful activity names.
10. Creates a final tidy data set by averaging the data for each subject
    and activity and outputting this to a file called
    UCI\_HAR\_Tidy\_Avgs.txt, which should match the data set in this
    repo.

The run\_analysis.R script is provided below for convenience:

    ##--------------------------------------------------------------
    ##
    ## Getting and Cleaning Data Course Project - Week 4 Assignment
    ##
    ## Title: run_analysis.R
    ##
    ## Author: Lindsey Buckle
    ##
    ## Script version: 1.0
    ##
    ## -------------------------------------------------------------
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
