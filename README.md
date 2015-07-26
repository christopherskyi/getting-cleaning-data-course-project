# Getting Cleaning Data Course Project Repo
Christopher Skyi, New York City

This a repo for the course project for the Johns Hopkins "Getting and Cleaning Data" course.

## Overview

The purpose of this project was to demonstrate my ability to collect, work with, and clean a data set. In this repo you'll find the following files:

* An R script (run_analysis.R) that will create a tidy data set (see Codebook.md)
* A code book that describes the variables in the tidy data set and how this data set is created
* This README.md

## Course Project Summary

This R script creates a tidy data set from the study ["Smartphone-Based Human Activity Recognition"](http://www.tdx.cat/bitstream/handle/10803/284725/TJLRO1de1.pdf?sequence=1)

A full description of the study's design can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

The raw data set can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

DOWNLOAD THE ZIP FILE INTO THE FOLDER WHERE YOU PUT THIS SCRIPT AND UNZIP FROM THERE.

The R script was created with R version 3.2.0 (2015-04-16)

Required packages: plyr dplyr

To obtain the final tidy data set, 'tidyDataSet,' the R script will perform the following 
5 transformations:

* Merge the training and the test sets to create one data set.
* Extract only the measurements on the mean and standard deviation for each measurement. 
* Use descriptive activity names to name the activities in the data set
* Appropriately label the data set with descriptive activity names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

 