---
title: "Human Activity Recognition Using Smartphones Dataset Version 2.0"
author: "JuanaAM"
date: "3/7/2020"
output: html_document
---

The project consists in processing the Human Activity Recognition Using Smartphones Dataset Version 1.0. The original data set was collected in a experiment with a group of 30 volunteers performing six activities (walking, walking_upstairs, walking_downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. The data provided by this experiment was compiled, cleaned, organized and averaged as it was required by assignment of week 4 in the course Getting and Cleaning Data.

This repository contains: 

- README.md
- run_analysis.R: R Code used to create the file newHumanActRec.txt.
- CodeBook.md: Description of project, transformations performed to the original data, resulting data and its variables. 

run_analysis.R works as follows:

 - First part downloads the file into the working directory, the downloaded zip file is then unzipped using the function unzip, this creates a folder named UCI HAR Dataset in our working directory.
 
 - Second part opens the files needed in this project(activity_labels.txt, features.txt, Xtest.txt, ytest.txt, subject_test.txt, Xtrain.txt, ytrain.txt and subject_train.txt). In this step, column names are added to the files Xtest and Xtrain using the features file. For ytest, ytrain the column is named activity and for subject_test and subject_train the column is named activity
 
 - Third part merges the data into a single file. Firstly each of the sets (Xsets, Xtrain) is merged to the corresponding subjects and activities using the function cbind, then the two obtained datasets are merged using the function rbind.

- Fourth part extracts only the measurements on the mean and standard deviation. To perform this step, the dataset is filtered through the function grep, selecting only data which contains the strings "mean." and "std." in the column names, the points are included because they were added to the names of the columns when the datasets were read, not including them also extracts the measurements on the mean frequency.

- Fifth part assigns labels to the activities. The original activity set has numbers representation of the activities, to change them the data is subseted according to that number and renamed using the function gsub, the corresponding label is then assigned as specified in the activity_label file from the original data.

- Sixth part changes variable names. The points added to the column names while reading the files are removed and the first letter of the words mean and std are changed to upper case, both are performed with the function gsub. This step is made in order to make the names easier to read. 

- Seventh part creates the final data set with the average of each variable for each activity and each subject. The dataset is splitted into groups with the function groupby from the dplyr package, which is loaded just before this step with the library function, each group represents one subject and one activity, resulting in 180 groups since there were 30 volunteers performing 6 activities in the experiment. For each group columns were averaged using the function summarize_all also from dplyr package.

- Finally the data set was saved using the function write_table.

For more information on original data, final data set and description of variables read CodeBook.md.