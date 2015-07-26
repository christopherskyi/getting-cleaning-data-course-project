##########################################################################################################

## Coursera Getting and Cleaning Data Course Project
## Christopher Skyi
## Sunday, July 26, 2015, New York City, [86-74]F, 60% chance of thunderstorms by evening

# run_analysis.R Description:

# This script creates a tidy data set from the study, "Smartphone-Based Human Activity Recognition." 
# The full study can be read online @
# http://www.tdx.cat/bitstream/handle/10803/284725/TJLRO1de1.pdf?sequence=1
# 
# A full description of the study's design can be found @
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# 
# The raw data set can be downloaded from
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#
# DOWNLOAD THE ZIP FILE INTO THE FOLDER WHERE YOU PUT THIS SCRIPT AND UNZIP FROM THERE.
#
# This script was created with R version 3.2.0 (2015-04-16)
#
# Required packages: plyr dplyr
#
# To obtain the final tidy data set, 'tidyDataSet,' this script will perform the following 
# 5 transformations:
#
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##########################################################################################################

# load required libraries
library(plyr)
library(dplyr)

##########################################################################################################
# Step 1: Merge the training and the test sets to create one data set.
##########################################################################################################
# Create independent variable (iv) and dependent variable (dv) data sets

# Read the 561 attributes (called a 'vector of features' in README.txt) into a data frame:
dv_names <- read.table('UCI HAR Dataset/features.txt',header=FALSE, stringsAsFactors = FALSE); 
dv_names$V2 <- tolower(dv_names$V2) 

# Read in the 6 activity names into a data frame:
iv_activityNames <-read.table('UCI HAR Dataset/activity_labels.txt',header=FALSE);
iv_activityNames$V2 <- tolower(iv_activityNames$V2)
  
# Read in activity IDs for training set (IDs for the 6 activities)
train_activityID <- read.table('UCI HAR Dataset/train/Y_train.txt',header=FALSE) 

# Read in activity IDs for test set (IDs for the 6 activities)
test_activityID <- read.table('UCI HAR Dataset/test/y_test.txt',header=FALSE)

# Read in observations/subject in the training partition (21 subjects, 7352 total obs)
iv_subjectTrain <-read.table('UCI HAR Dataset/train/subject_train.txt',header=FALSE) 

# Read in observations/ test subject (we have data from 9 subjects, 2947 total obs) - use table(subject_test) to see freq
iv_subjectTest <- read.table('UCI HAR Dataset/test/subject_test.txt',header=FALSE)

# Read in the training and  test data sets

# Read in training data (called the 'Training set'in README.txt) into a data frame:
dv_trainData <- read.table('UCI HAR Dataset/train/X_train.txt',header=FALSE)

# Read in test data (called the 'Test set'in README.txt) into a data frame:
dv_testData <- read.table('UCI HAR Dataset/test/x_test.txt',header=FALSE)

# Assigin human readable variable names to all data sets
colnames(iv_subjectTrain) <- "subject"
colnames(iv_subjectTest) <- "subject"
colnames(dv_trainData) <- dv_names[,2]
colnames(dv_testData) <- dv_names$V2 # features[,2]
colnames(train_activityID) <- "activityid";
colnames(test_activityID) <- "activityid";

# create complete training and test data sets: add subject variable and activityId variable to x_train & x_test 
dv_trainData_c <- cbind(dv_trainData,iv_subjectTrain,train_activityID)
dv_testData_c <- cbind(dv_testData,iv_subjectTest,test_activityID)

# build full data set by appending test onto train
mergedData <- rbind(dv_trainData_c,dv_testData_c)

##########################################################################################################
# Step 2: Extract only the measurements on the mean and standard deviation for each measurement
# (but also include the activityid and subject variables, as I will need those later)
##########################################################################################################
mergedDataVariables <- names(mergedData) # get all columergedDataVariables names

# meanVariableNames & stdVariableNames will have 86 total names
meanVariableNames <- grep("mean",tolower(mergedDataVariables),value=TRUE)
stdVariableNames <- grep("std",tolower(mergedDataVariables),value=TRUE)

# include subject and activityid variables because I'll need them later
subActNames <- c("activityid","subject")

meanStdNames <- c(meanVariableNames,stdVariableNames,subActNames)
meanStdDataSet <- mergedData[,meanStdNames]

##########################################################################################################
# Step 3. Use descriptive activity names to name the activities in the data set
##########################################################################################################
meanStdDataSet <- merge(meanStdDataSet,iv_activityNames,by.x="activityid",by.y="V1",all=TRUE)

##########################################################################################################
# Step 4. Appropriately label the data set with descriptive activity names. 
##########################################################################################################

# get all the current column names
meanStdDataSetnames <- colnames(meanStdDataSet)

# Rename the "V2" column name to the descriptive column name "activity"
meanStdDataSetnames[89] <- "activity"

# remove "()" from variable names and change other to make more human readable
meanStdDataSetnames <- sub("\\()","",meanStdDataSetnames)
meanStdDataSetnames <- sub("std","stdev",meanStdDataSetnames)
meanStdDataSetnames <- sub("^(f)","freq-",meanStdDataSetnames)
meanStdDataSetnames <- sub("^(t)","time-",meanStdDataSetnames)

# reassign more descriptive column names
colnames(meanStdDataSet) <- meanStdDataSetnames

##########################################################################################################
# Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
#    for each activity and each subject.
##########################################################################################################

# remove 'activitiyid' column
meanStdDataSet <- subset(meanStdDataSet, select=-c(activityid))

tidyDataSet = ddply(meanStdDataSet, c("subject","activity"), numcolwise(mean))

# Export the tidyData set 
write.table(tidyDataSet, 'TidyData/tidyData.txt',row.name=FALSE,sep='\t');