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

The tidy data set contains the  86 derived mean and standard devivation variables, plus subject and activity variables, for a total of 88 variables. All variables except 'activity' are numbers; activity is a character variable:

1       subject
2       activity
3	time-bodyacc-mean-x
4	time-bodyacc-mean-y
5	time-bodyacc-mean-z
6	time-gravityacc-mean-x
7	time-gravityacc-mean-y
8	time-gravityacc-mean-z
9	time-bodyaccjerk-mean-x
10	time-bodyaccjerk-mean-y
11	time-bodyaccjerk-mean-z
12	time-bodygyro-mean-x
13	time-bodygyro-mean-y
14	time-bodygyro-mean-z
15	time-bodygyrojerk-mean-x
16	time-bodygyrojerk-mean-y
17	time-bodygyrojerk-mean-z
18	time-bodyaccmag-mean
19	time-gravityaccmag-mean
20	time-bodyaccjerkmag-mean
21	time-bodygyromag-mean
22	time-bodygyrojerkmag-mean
23	freq-bodyacc-mean-x
24	freq-bodyacc-mean-y
25	freq-bodyacc-mean-z
26	freq-bodyacc-meanfreq-x
27	freq-bodyacc-meanfreq-y
28	freq-bodyacc-meanfreq-z
29	freq-bodyaccjerk-mean-x
30	freq-bodyaccjerk-mean-y
31	freq-bodyaccjerk-mean-z
32	freq-bodyaccjerk-meanfreq-x
33	freq-bodyaccjerk-meanfreq-y
34	freq-bodyaccjerk-meanfreq-z
35	freq-bodygyro-mean-x
36	freq-bodygyro-mean-y
37	freq-bodygyro-mean-z
38	freq-bodygyro-meanfreq-x
39	freq-bodygyro-meanfreq-y
40	freq-bodygyro-meanfreq-z
41	freq-bodyaccmag-mean
42	freq-bodyaccmag-meanfreq
43	freq-bodybodyaccjerkmag-mean
44	freq-bodybodyaccjerkmag-meanfreq
45	freq-bodybodygyromag-mean
46	freq-bodybodygyromag-meanfreq
47	freq-bodybodygyrojerkmag-mean
48	freq-bodybodygyrojerkmag-meanfreq
49	angle(tbodyaccmean,gravity)
50	angle(tbodyaccjerkmean),gravitymean)
51	angle(tbodygyromean,gravitymean)
52	angle(tbodygyrojerkmean,gravitymean)
53	angle(x,gravitymean)
54	angle(y,gravitymean)
55	angle(z,gravitymean)
56	time-bodyacc-stdev-x
57	time-bodyacc-stdev-y
58	time-bodyacc-stdev-z
59	time-gravityacc-stdev-x
60	time-gravityacc-stdev-y
61	time-gravityacc-stdev-z
62	time-bodyaccjerk-stdev-x
63	time-bodyaccjerk-stdev-y
64	time-bodyaccjerk-stdev-z
65	time-bodygyro-stdev-x
66	time-bodygyro-stdev-y
67	time-bodygyro-stdev-z
68	time-bodygyrojerk-stdev-x
69	time-bodygyrojerk-stdev-y
70	time-bodygyrojerk-stdev-z
71	time-bodyaccmag-stdev
72	time-gravityaccmag-stdev
73	time-bodyaccjerkmag-stdev
74	time-bodygyromag-stdev
75	time-bodygyrojerkmag-stdev
76	freq-bodyacc-stdev-x
77	freq-bodyacc-stdev-y
78	freq-bodyacc-stdev-z
79	freq-bodyaccjerk-stdev-x
80	freq-bodyaccjerk-stdev-y
81	freq-bodyaccjerk-stdev-z
82	freq-bodygyro-stdev-x
83	freq-bodygyro-stdev-y
84	freq-bodygyro-stdev-z
85	freq-bodyaccmag-stdev
86	freq-bodybodyaccjerkmag-stdev
87	freq-bodybodygyromag-stdev
88	freq-bodybodygyrojerkmag-stdev
