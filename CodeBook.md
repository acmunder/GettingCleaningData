---
title: "Codebook for Assignment
author: "acmunder"
date: "19/03/2017"

---

## Project Description
Peer-graded Assignment: Getting and cleaning Data Course Project




## Study design and data processing

### Notes on the data 
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. For further information, 
visit http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones




## Creating the tidy datafile

### Guide to create the tidy data file

The "run_analysis.R" script executes the following steps:
1. Downloades and unzips and loads the required data.
2. Assigns column names.
3. Merges the training and the test data to create one data set.
4. Extracts all columns containing mean and standard deviation values for each    measurement (according to the column name).
5. Uses descriptive activity names for the activities in the data set.
6. Appropriately labels the data set with descriptive variable names.
7. Sorts the output according to the subject number (or according to the 
activity, alternatively)
8. Creates a second, tidy data set with the average of each variable for each activity and each subject. 
Each step is further explained within the script.

The output of the "run_analysis.R" script is saved as "second_dataset.txt"




## Description of the variables in the second_dataset.txt file

 - class: data frame
 - 180 observations of 81 variables
 - Variables present in the dataset:
 
        1 subject
        2 activity
        3 tBodyAcc-mean()-X
        4 tBodyAcc-mean()-Y
        5 tBodyAcc-mean()-Z
        6 tBodyAcc-std()-X
        7  tBodyAcc-std()-Y
        8 tBodyAcc-std()-Z
        9 tGravityAcc-mean()-X
        10 tGravityAcc-mean()-Y
        11 tGravityAcc-mean()-Z
        12 tGravityAcc-std()-X
        13 tGravityAcc-std()-Y
        14 tGravityAcc-std()-Z
        15 tBodyAccJerk-mean()-X
        16 tBodyAccJerk-mean()-Y
        17 tBodyAccJerk-mean()-Z
        18 tBodyAccJerk-std()-X
        19 tBodyAccJerk-std()-Y
        20 tBodyAccJerk-std()-Z
        21 tBodyGyro-mean()-X
        22 tBodyGyro-mean()-Y
        23 tBodyGyro-mean()-Z
        24 tBodyGyro-std()-X
        25 tBodyGyro-std()-Y
        26 tBodyGyro-std()-Z
        27 tBodyGyroJerk-mean()-X
        28 tBodyGyroJerk-mean()-Y
        29 tBodyGyroJerk-mean()-Z
        30 tBodyGyroJerk-std()-X
        31 tBodyGyroJerk-std()-Y
        32 tBodyGyroJerk-std()-Z
        33 tBodyAccMag-mean()
        34 tBodyAccMag-std()
        35 tGravityAccMag-mean()
        36 tGravityAccMag-std()
        37 tBodyAccJerkMag-mean()
        38 tBodyAccJerkMag-std()
        39 tBodyGyroMag-mean()
        40 tBodyGyroMag-std()
        41 tBodyGyroJerkMag-mean()
        42 tBodyGyroJerkMag-std()
        43 fBodyAcc-mean()-X
        44 fBodyAcc-mean()-Y
        45 fBodyAcc-mean()-Z
        46 fBodyAcc-std()-X
        47 fBodyAcc-std()-Y
        48 fBodyAcc-std()-Z
        49 fBodyAcc-meanFreq()-X
        50 fBodyAcc-meanFreq()-Y
        51 fBodyAcc-meanFreq()-Z
        52 fBodyAccJerk-mean()-X
        53 fBodyAccJerk-mean()-Y
        54 fBodyAccJerk-mean()-Z
        55 fBodyAccJerk-std()-X
        56 fBodyAccJerk-std()-Y
        57 fBodyAccJerk-std()-Z
        58 fBodyAccJerk-meanFreq()-X
        59 fBodyAccJerk-meanFreq()-Y
        60 fBodyAccJerk-meanFreq()-Z
        61 fBodyGyro-mean()-X
        62 fBodyGyro-mean()-Y
        63 fBodyGyro-mean()-Z
        64 fBodyGyro-std()-X
        65 fBodyGyro-std()-Y
        66 fBodyGyro-std()-Z
        67 fBodyGyro-meanFreq()-X
        68 fBodyGyro-meanFreq()-Y
        69 fBodyGyro-meanFreq()-Z
        70 fBodyAccMag-mean()
        71 fBodyAccMag-std()
        72 fBodyAccMag-meanFreq()
        73 fBodyBodyAccJerkMag-mean()
        74 fBodyBodyAccJerkMag-std()
        75 fBodyBodyAccJerkMag-meanFreq()
        76 fBodyBodyGyroMag-mean()
        77 fBodyBodyGyroMag-std()
        78 fBodyBodyGyroMag-meanFreq()
        79 fBodyBodyGyroJerkMag-mean()
        80 fBodyBodyGyroJerkMag-std()
        81 fBodyBodyGyroJerkMag-meanFreq()
        





### Variable 1 
"subject"

- this is the unique ID of each participant.
- class: numerical
- ranging from 1 to 30




### Variable 2 
"activity"

- this is the type of activity performed
- class: character 
        "laying"
        "sitting"
        "standing"
        "walking"
        "walking downstairs"
        "walking upstairs"





### Variable 3-81 
Averaged results for all individual measurements that represented means or standard deviations in the original dataset (see descriptive column names).

- class: numerical




## Sources
the data set used:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
