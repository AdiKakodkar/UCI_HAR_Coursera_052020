# Human Activity Recognition Using Smartphones Dataset: Tidy Data Exercise (Version 1.0)
# Author: Adi Kakodakar ( copyright,2020)
# Note: Please make sure that the UCI HAR Dataset (complete unzipped version) is in your working directory before running this script

#required libraries
library(dplyr)
library(data.table)

#get text file
test_set <- read.table( file = "getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "", dec = ".")
train_set <- read.table( file = "getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "", dec = ".")

#get feature file
df_names_X_test <- read.table("c3AssignmentData/UCIHARDataset/features.txt", sep = "")

#convert feature file to character vector
X_colNames <- as.vector(df_names_X_test$V2)

#set column names using feature names in X_colNames
names(test_set) <- X_colNames
names(train_set) <- X_colNames

#combine test and train dataset
test_train_set <- rbind(test_set, train_set)

#remove duplicate columns
test_dup <- subset(test_train_set, select=which(!duplicated(names(test_train_set))))

#select only mean and sd
mean_sd_select <- select(test_dup, contains("mean()") | contains("std()"))

#get activity labels
act_labels_test <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", sep = "")
act_labels_train <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", sep = "")

#update column name
names(act_labels_test) <- c("ActivityLabel")
names(act_labels_train) <- c("ActivityLabel")

#combine Activity Labels
activity_set <- rbind(act_labels_test, act_labels_train)

#replace activity names in place of numbers
for(i in 1:nrow(activity_set)){
              if(activity_set$ActivityLabel[i] == 1){
                      activity_set$ActivityLabel[i] <- "WALKING"  
              }else if(activity_set$ActivityLabel[i] == 2){
                      activity_set$ActivityLabel[i] <- "WALKING_UPSTAIRS"
              }else if(activity_set$ActivityLabel[i] == 3){
                      activity_set$ActivityLabel[i] <- "WALKING_DOWNSTAIRS"
              }else if(activity_set$ActivityLabel[i] == 4){
                      activity_set$ActivityLabel[i] <- "SITTING"
              }else if(activity_set$ActivityLabel[i] == 5){
                      activity_set$ActivityLabel[i] <- "STANDING"
              }else if(activity_set$ActivityLabel[i] == 6){
                      activity_set$ActivityLabel[i] <- "LAYING"
              }
}

# #Add activity labels to the combined: mean + sd dataset
smaller_dataset <- cbind(mean_sd_select, activity_set)

#cleanUp the  column names
names(smaller_dataset) <- gsub( x = names(smaller_dataset), pattern = "-std\\()", replacement = "StdDeviation")
names(smaller_dataset) <- gsub( x = names(smaller_dataset), pattern = "z", replacement = "Mean")
names(smaller_dataset) <- gsub( x = names(smaller_dataset), pattern = "Acc", replacement = "Acceleration")
names(smaller_dataset) <- gsub( x = names(smaller_dataset), pattern = "Gyro", replacement = "Orientation")
names(smaller_dataset) <- gsub( x = names(smaller_dataset), pattern = "Mag", replacement = "Magnitude")

#add subject column
subject_test <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", sep = "")
subject_train <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", sep = "")

#combine subject test and train sets
combined_subjects <- rbind(subject_test, subject_train)

#add column name to the combined subjects
names(combined_subjects) <- c("subjects")

#Add subjects into the final smaller dataset
smaller_dataset <- cbind(smaller_dataset, combined_subjects)

#Aggregate data by activity and subject
aggdata <-aggregate(smaller_dataset, by=list(smaller_dataset$ActivityLabel, smaller_dataset$subjects),FUN=mean, na.rm=TRUE)

#change column names of the new groups
aggdata <- rename(aggdata, Activity = Group.1)
aggdata <- rename(aggdata, Subjects = Group.2)

#remove old activitylabel and subjects columns
aggdata <- aggdata[-c(69, 70)]

#rearrange columns to put subjects first
agg_tidy_data <- aggdata[, c(2, 1, 3:68)]

#write table to file for submission
write.table(agg_tidy_data, file = "tidyDataFile.txt", row.names = FALSE)
