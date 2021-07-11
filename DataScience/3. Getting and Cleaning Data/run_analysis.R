####################################################################################
#
# Coursera assessment
# "Getting and Cleaning Data" https://class.coursera.org/getdata-010

# Script: run_analysis.R
# Author: Robinson Montes <mecomontes@gmail.com>
# No Copyrights, Public Domain
# July 2020

# Description:
#
# You should create one R script called run_analysis.R that does the following. 
# 1 - Merges the training and the test sets to create one data set.
# 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3 - Uses descriptive activity names to name the activities in the data set
# 4 - Appropriately labels the data set with descriptive variable names. 
# 5 - From the data set in step 4, creates a second, independent tidy data set with the average
#     of each variable for each activity and each subject.

# 6 - Please upload the tidy data set created in step 5 of the instructions.
#     Please upload your data set as a txt file created with write.table() using row.name=FALSE

# 7 - Please submit a link to a Github repo with the code for performing your analysis.
#     The code should have a file run_analysis.R in the main directory that can be run as long
#     as the Samsung data is in your working directory. The output should be the tidy data set
#     you submitted for part 1. You should include a README.md in the repo describing how the
#     script works and the code book describing the variables.


####################################################################################
# 0 - Previous Seetings
####################################################################################

# Download and unzip the Data set
rm(list=ls())
date()
base_path <- '/home/meco/Desktop/Coursera/datasciencecoursera/course3'
setwd(base_path)
URL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
if (!file.exists('TidyData')) {dir.create('TidyData')}
base_path <- '/home/meco/Desktop/Coursera/datasciencecoursera/course3/TidyData'
setwd(base_path)
download.file(URL, destfile = 'data.zip', method = "curl")
unzip('data.zip')
base_path <- '/home/meco/Desktop/Coursera/datasciencecoursera/course3/TidyData/UCI HAR Dataset'
setwd(base_path)

####################################################################################
# 1 - Merge training and test set
####################################################################################

# Create paths and extract the column names
test_path <- paste(base_path, '/test', sep = '')
train_path <- paste(base_path, '/train', sep = '')
raw_names <- read.table(paste(base_path, '/features.txt', sep = ''))
col_names <- t(raw_names[-1])

# Read all the training data and binding them 
train_prev <- read.table(paste(train_path, '/X_train.txt', sep = ''))
train_subject <- read.table(paste(train_path, '/subject_train.txt', sep = ''))
train_activity <- read.table(paste(train_path, '/y_train.txt', sep = ''))
train <- cbind(train_prev, train_subject, train_activity)
dim(train)

# Read all the testing data and binding them 
test_prev <- read.table(paste(test_path, '/X_test.txt', sep = ''))
test_subject <- read.table(paste(test_path, '/subject_test.txt', sep = ''))
test_activity <- read.table(paste(test_path, '/y_test.txt', sep = ''))
test <- cbind(test_prev, test_subject, test_activity)
dim(test)

# merging training and testing data sets
data <- rbind(train, test)
data_dim <- dim(data)

#############################################################################################
# 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
#############################################################################################

new_cols <- raw_names[which(grepl(pattern = "std\\(\\)|mean\\(\\)", x = raw_names[, 2])), ]
new_data <- data[, c(new_cols[, 1], data_dim[2] - 1, data_dim[2])]
dim(new_data)

####################################################################################
# 3 - Uses descriptive activity names to name the activities in the data set
####################################################################################

activity_labels <- read.table(paste(base_path, '/activity_labels.txt', sep = ''), col.names = c('id', 'activity.label'))
colnames(new_data) <- t(new_cols[, 2])
names(new_data)[67] <- "subject"
names(new_data)[68] <- "activity"

# Merge de data using activity and id labels
merged_data <- merge(new_data, activity_labels, by.x = "activity", by.y = "id")

# Check the obtained table
table(merged_data[, c("activity", "activity.label")])

####################################################################################
# 4 - Appropriately labels the data set with descriptive variable names. 
####################################################################################

# It's doing in above point, just check it!
str(merged_data)

####################################################################################
# 5 - From the data set in step 4, creates a second, independent tidy data set with
#     the average of each variable for each activity and each subject.
####################################################################################

tidyData <- aggregate(merged_data[, 2:67], by = list(merged_data$subject, merged_data$activity.label), FUN = mean)
# Check first rows of the tidy data
head(tidyData)

# Check last rows of the tidy data
tail(tidyData)

# Check whole rows of the tidy data
View(tidyData)

####################################################################################
# 6 - Please upload the tidy data set created in step 5 of the instructions.
#     Please upload your data set as a txt file created with write.table() using 
#   row.name=FALSE
####################################################################################

result <- "tidydata.txt"
getwd()
write.table(tidyData, file = result, row.names = TRUE)
dim(tidyData)

# Show whole the tidying data read
View(read.table(result, header = TRUE))

##############################################################################################
# 7 - Please submit a link to a Github repo with the code for performing your analysis.
#     The code should have a file run_analysis.R in the main directory that can be run as long
#     as the Samsung data is in your working directory. The output should be the tidy data set
#     you submitted for part 1. You should include a README.md in the repo describing how the
#     script works and the code book describing the variables.
##############################################################################################

