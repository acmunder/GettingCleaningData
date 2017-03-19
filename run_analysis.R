run_analysis <- function () {
        
        #downloading dataset
        url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        destination <- file.path(getwd(), "dataset.zip")
        download.file(url, destination)
        
        #unzipping dataset
        unzip(zipfile="./Dataset.zip")
        
        
  
        
        #loading activity_labels
        activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
        
        ##loading features
        features <- read.table("./UCI HAR Dataset/features.txt")
        
        ##loading test data
        subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        x_test <-  read.table("./UCI HAR Dataset/test/X_test.txt")
        y_test <-  read.table("./UCI HAR Dataset/test/y_test.txt")
        
        ##loading train data
        subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
        y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")        
        
        
        
        
        #assigning column names
        colnames(x_train) <- features[,2] 
        colnames(y_train) <-"activity_id"
        colnames(subject_train) <- "subject"
        
        colnames(x_test) <- features[,2] 
        colnames(y_test) <- "activity_id"
        colnames(subject_test) <- "subject"
        
        colnames(activity_labels) <- c("activity_id","activity_type")
        
        
        
        #merging train and test data sets
        
        train_merged <- cbind(subject_train, y_train, x_train)
        test_merged <- cbind(subject_test, y_test, x_test)
        combined_dataset <- rbind (train_merged, test_merged)
        
        
        
        
        #extracting columns with mean and standard deviation for each measurement
        
        col_names <- colnames(combined_dataset)
        mean_and_std <- (grepl ("subject", col_names) |
                        grepl ("activity_id", col_names) |         
                        grepl ("mean..", col_names) | 
                        grepl ("std..", col_names))
        data_subset <- combined_dataset [, mean_and_std] 
        
        
        
        
        #using descriptive names for activities
        
        data_subset$activity_id <- as.character(data_subset$activity_id)
        
        data_subset$activity_id[data_subset$activity_id == 1] <- "walking"
        data_subset$activity_id[data_subset$activity_id == 2] <- "walking upstairs"
        data_subset$activity_id[data_subset$activity_id == 3] <- "walking downstairs"
        data_subset$activity_id[data_subset$activity_id == 4] <- "sitting"
        data_subset$activity_id[data_subset$activity_id == 5] <- "standing"
        data_subset$activity_id[data_subset$activity_id == 6] <- "laying"
        
        #choosing a more generic name for the "activity" column
        colnames(data_subset)[colnames(data_subset)=="activity_id"] <- "activity"
        
        
        #replacing abbreviations in variables with full names
        names(data_subset)<-gsub("^t", "time", names(data_subset))
        names(data_subset)<-gsub("^f", "frequency", names(data_subset))
        names(data_subset)<-gsub("Acc", "Accelerometer", names(data_subset))
        names(data_subset)<-gsub("Gyro", "Gyroscope", names(data_subset))
        names(data_subset)<-gsub("Mag", "Magnitude", names(data_subset))
        names(data_subset)<-gsub("BodyBody", "Body", names(data_subset))
        
        
        
        
        
        
        
        
        
        #sorting according to subject number (dplyr package required)
        library(plyr)
        data_subset <- arrange (data_subset, subject) 
        
        #alternatively, sorting according to activity (dplyr package required)
        #data_subset <- arrange (data_subset, activity)
        
        
        
        
        #creating second data set with with the average of each variable 
        #for each activity and each subject (data.table package required)
        library(data.table)
        temp <- data.table(data_subset)   
        second_dataset <- temp[, lapply(.SD, mean), by = "subject,activity"]
        write.table(second_dataset, file = "second_dataset.txt", row.names = FALSE)
        
        
}