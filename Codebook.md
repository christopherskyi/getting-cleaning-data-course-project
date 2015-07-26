# Codebook for Getting Cleaning Data Course Project 

## Study Design and Raw Data Sets Created by run_analysis.R

The experiments have been carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on their waist. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

1. dv_names data set contains 561 variables (561-feature vector with time and frequency domain variables), derived from the two dependent measures, 3-axial linear acceleration and 3-axial angular velocity (tAcc-XYZ and tGyro-XYZ)

2 The iv_activityNames data set contains the 6 activity names: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING 

3. The train_activityID data set contains activity IDs for training set (1:6). 

4. The test_activityID data set contains activity IDs for test set (1:6). 

5. The iv_subjectTrain data set contains observations/subject in the training partition (21 subjects, 7352 total obs). 

6. The iv_subjectTest data set contains observations/subject in the test partition (we have data from 9 subjects, 2947 total obs). 

7. The dv_trainData data set contains all the training data (7352 obs of 561 derived variables).

8. The dv_testData data set contains all the test data (2947 obs of 561 derived variables).

## Creating the Tidy Data Set

The raw data set can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

DOWNLOAD THE ZIP FILE INTO THE FOLDER WHERE YOU PUT the run_analysis.R SCRIPT AND UNZIP IT THERE.

After that, just run the R script to create the final tidy data set.

### Specific Steps:
To obtain the final tidy data set, 'tidyDataSet,' the R script will perform the following 
5 transformations:

* Merge the training and the test sets to create one data set.
  It creates complete training and test data sets by adding subject variable and activityId   variable to dv_trainData & dv_testData using cbind; It then build full data set by appending test onto train using rbind.

* Extract only the measurements on the mean and standard deviation for each measurement.
  It creates a vector of only the column names I need and then It simply subset the merged data set by those column names.
  
* It applies descriptive activity names to the merged data set.

* From the data set at this point, it then creates a second, independent tidy data set with the average of each variable for each activity and each subject using the ddply method.

## TidyDataSet Variables

The tidy data set contains the  86 derived mean and standard devivation variables, plus subject and activity variables, for a total of 88 variables. All variables except 'activity' are numbers; activity is a character variable.
