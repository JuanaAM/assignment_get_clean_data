###Peer Graded Assignment week 4
###Getting and cleaning data


### Download and unzip files
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,
              destfile='DataAccelerometers.zip',
              mode="wb") 
unzip(zipfile = "DataAccelerometers.zip") # unpack the files into subdirectories 


#### Open data
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt", 
                    col.names = features[,2]) # add names to column using the file features
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt", 
                    col.names = c("activity"))
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
                           col.names = c("subjectID")) 
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt", 
                     col.names = features[,2]) # add names to column using the file features
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt", 
                     col.names = c("activity"))
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                            col.names = c("subjectID"))

### Merge data
data_test <- cbind(subject_test, ytest, xtest)
data_train <- cbind(subject_train, ytrain, xtrain)
merged_data <- rbind(data_test, data_train)


### Extract only mean and std values
data <- merged_data[grep("subject|activity|mean\\.|std\\.", names(merged_data))]

### Names of activities according to activity_labels dataset included in original data
data$activity <- gsub("1", "walking", data$activity,)
data$activity <- gsub("2", "walkingupstairs", data$activity,)
data$activity <- gsub("3", "walkingdownstairs", data$activity,)
data$activity <- gsub("4", "sitting", data$activity,)
data$activity <- gsub("5", "standing", data$activity,)
data$activity <- gsub("6", "laying", data$activity,)


### Names of variables 
names(data) <- gsub("\\.", "", names(data),)
names(data) <- gsub("mean", "Mean", names(data),)
names(data) <- gsub("std", "Std", names(data),)

### New data set
library(dplyr)
groups <- group_by(data, subjectID, activity)
newHumanActRec <- summarize_all(groups, mean)
write.table(newHumanActRec, "./newHumanActRec.txt")# save data as txt file on working directory
