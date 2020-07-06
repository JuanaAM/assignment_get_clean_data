--- 
title: "Codebook: Human Activity Recognition Using Smartphones Dataset Version 2.0"
author: "JuanaAM"
date: "1/7/2020"
output: html_document
---

## Project Description

The project consists in downloading, tiding and cleaning data previously collected from the accelerometers from the Samsung Galaxy S smartphone. The provided data was separated in different files which were merged into a single one, then only the information of interest was extracted, the variables were renamed and finally the data was averaged.

This codebook describes the proccess followed in this project, provides information on the original data set: Human Activity Recognition Using Smartphones dataset version 1.0. It also decribes the final data set and its variables.

## Collection of the raw data

The original data used in this project was obtained through the link [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip], which was extracted for this course assignment from the website [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

### Notes on the original (raw) data 

The original data was collected through an experiment carried out with a group of 30 volunteers. Each person performed six activities (walking, walking_upstairs, walking_downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.  The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data.[1]

The original data set includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

Both test and trainig sets have 561 variables. Features are normalized and bounded within [-1,1].[1]

## Creating and cleaning the file

The process followed was:

1) Download the data through the link provided before.

2) Unzip the downloaded file.

3) Open the files needed in this project(activity_labels.txt, features.txt, Xtest.txt, ytest.txt, subject_test.txt, Xtrain.txt, ytrain.txt and subject_train.txt). 

4) Merge the test and training data sets to create a single data set. Firstly each of the sets were merged to the corresponding subjects and activities, then the two obtained datasets were merged.

5) Extract the measurements on the mean and standard deviation. To perform this step the dataset was filtered by selecting only data which contained the strings "mean." and "std." 

6) Assign labels to the activities. The original activity set had numbers representation of the activities, the corresponding label was assigned as specified in the activity_label file from the original data set.  

7) Change variable names, this was made in order to make the names easier to read. 

8) Create the final data set with the average of each variable for each activity and each subject. 

10) Write new file using the function write.table.

More detailed information on functions used in the code run_analysis.R can be found in the file README.

## Description of the variables

The dataset named newHumanActRec is a text file which can be read into R using the function read.table. 

There are 10 observations (raws), each of these represent one object and one activity, resulting in 6 rows per subject.

Columns of the data set represent 68 variable:

subjectID, activity, tBodyAccmeanX, tBodyAccmeanY, tBodyAccmeanZ, tBodyAccstdX, tBodyAccstdY, tBodyAccstdZ, tGravityAccmeanX, tGravityAccmeanY, tGravityAccmeanZ, tGravityAccstdX, tGravityAccstdY, tGravityAccstdZ, tBodyAccJerkmeanX, tBodyAccJerkmeanY, tBodyAccJerkmeanZ, tBodyAccJerkstdX, tBodyAccJerkstdY, tBodyAccJerkstdZ, tBodyGyromeanX, tBodyGyromeanY, tBodyGyromeanZ, tBodyGyrostdX, tBodyGyrostdY, tBodyGyrostdZ, tBodyGyroJerkmeanX, tBodyGyroJerkmeanY, tBodyGyroJerkmeanZ, tBodyGyroJerkstdX, tBodyGyroJerkstdY, tBodyGyroJerkstdZ, tBodyAccMagmean, tBodyAccMagstd, tGravityAccMagmean, tGravityAccMagstd, tBodyAccJerkMagmean, tBodyAccJerkMagstd, tBodyGyroMagmean, tBodyGyroMagstd, tBodyGyroJerkMagmean, tBodyGyroJerkMagstd, fBodyAccmeanX, fBodyAccmeanY, fBodyAccmeanZ, fBodyAccstdX, fBodyAccstdY, fBodyAccstdZ, fBodyAccJerkmeanX, fBodyAccJerkmeanY, fBodyAccJerkmeanZ, fBodyAccJerkstdX, fBodyAccJerkstdY, fBodyAccJerkstdZ, fBodyGyromeanX, fBodyGyromeanY, fBodyGyromeanZ, fBodyGyrostdX, fBodyGyrostdY, fBodyGyrostdZ, fBodyAccMagmean, fBodyAccMagstd, fBodyBodyAccJerkMagmean, fBodyBodyAccJerkMagstd, fBodyBodyGyroMagmean, fBodyBodyGyroMagstd, fBodyBodyGyroJerkMagmean, fBodyBodyGyroJerkMagstd.

**subjectID** represents the ID of the person who performed the test. 30 volunteers performed the experiment according to the raw data information. Integer class, numbers from 1 to 30.

**activity** represents one of the 6 activities executed during the experiment (laying, sitting, standing, walking, walking downstairs, walking upstairs). Character class.

For the rest of the variables the words in the names have the following meanings:

- Prefix t: Time domain signal.

- Prefix f: Frequency domain signal

- BodyAcc: Body acceleration signal

- GravityAcc: Gravity acceleration signal

- BodyGyro: Body gyroscope signal

- Jerk: Jerk signal

- Mag: Magnitude of signal

- Mean: Mean of the measurement

- Std: Standard deviation of the measurement

- X: X axis of signal

- Y: Y axis of signal

- Z: Z axis of signal

All of the variables named with these words are numeric class. From the original dataset all features were normalized and bounded within [-1,1], which makes these variables unitless.

## Sources

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012



