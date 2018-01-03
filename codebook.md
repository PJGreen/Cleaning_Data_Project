Code Book: Tidy Data Project
============================

Source dataset https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The R script called run_analysis.R that does the following.
Extracts only the measurements on the mean and standard deviation for each measurement int the test and training sets.
Uses descriptive activity names to name the activities in both data sets
Appropriately labels the data sets with descriptive activity names.
Merges the training and the test sets to create one data set.
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  This is tidy_mean_df

Only vaiables containing mean() & std() are used.
Requires the dplyr package.
Assumes the dataset is unzipped in the current directory.


Factors
-------
* subject_id: An identifier of the 30 volunteers within an age bracket of 19-48 years that carried out the experment
* activity_name: label describing the experiment activity

Measurements
------------
All measurements represents the mean value for the measurement, for each subject and activity_name

Dataset Name | Original Name
------------ | -------------
time_BodyAccMag_mean | tBodyAccMag-mean()
time_BodyAccMag_std | tBodyAccMag-std()
time_GravityAccMag_mean | tGravityAccMag-mean()
time_GravityAccMag_std | tGravityAccMag-std()
time_BodyAccJerkMag_mean | tBodyAccJerkMag-mean()
time_BodyAccJerkMag_std | tBodyAccJerkMag-std()
time_BodyGyroMag_mean | tBodyGyroMag-mean()
time_BodyGyroMag_std | tBodyGyroMag-std()
freq_BodyGyroJerkMag_mean | fBodyAccMag-mean()
freq_BodyGyroJerkMag_std | fBodyAccMag-std()
freq_BodyBodyAccJerkMag_mean | fBodyBodyAccJerkMag-mean()
freq_BodyBodyAccJerkMag_std | fBodyBodyAccJerkMag-std()
freq_BodyBodyGyroMag_mean | fBodyBodyGyroMag-mean()
freq_BodyBodyGyroMag_std | fBodyBodyGyroMag-std()
freq_BodyBodyGyroJerkMag_mean | fBodyBodyGyroJerkMag-mean()
freq_BodyBodyGyroJerkMag_std | fBodyBodyGyroJerkMag-std()
