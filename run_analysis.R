#load activity labels and create vector for id lookup
activity_df<-read.table("activity_labels.txt")
names(activity_df)<-c("activity_id","activity")
activity_vector <- as.vector(activity_df$activity)

#load features to be used to name test and training data features
features_df <- read.table("features.txt")
header_list<-features_df[,2]
features_to_extract<-grep("mean[(][)]$|std[(][)]$", header_list,value = T)

#load and name columns for test set
X_test_df <- read.table("./test/x_test.txt")
names(X_test_df)<-header_list
X_test_df<-X_test_df[, features_to_extract]

#load and bind test activity names
y_test_df <- read.table("./test/y_test.txt", sep=" ")
names(y_test_df) <- c("activity_id")
activity_names<-activity_vector[y_test_df$activity_id]
X_test_df<-cbind(activity_names, X_test_df)

#load and bind test subject ids
sub_test_df <- read.table("./test/subject_test.txt", sep=" ")
names(sub_test_df)<-c("subject_id")
X_test_df<-cbind(sub_test_df, X_test_df)

#load and name columns for training set
X_train_df <- read.table("./train/x_train.txt")
names(X_train_df)<-header_list
X_train_df <-X_train_df[,features_to_extract]

#load and bind training activity names
y_train_df <- read.table("./train/y_train.txt", sep=" ")
names(y_train_df)<-c("activity_id")
activity_names<-activity_vector[y_train_df$activity_id]
X_train_df<-cbind(activity_names, X_train_df)

#load and bind training subject ids
sub_train_df<-read.table("./train/subject_train.txt", sep=" ")
names(sub_train_df)<-c("subject_id")
X_train_df<-cbind(sub_train_df, X_train_df)

#bind test and training dataframes
tidy_df<-rbind(X_train_df, X_test_df)
tidy_df[,'subject_id']<-factor(tidy_df[,'subject_id'])

#rename columns
names(tidy_df)[names(tidy_df) == "tBodyAccMag-mean()"] <- "time_BodyAccMag_mean"
names(tidy_df)[names(tidy_df) == "tBodyAccMag-std()"] <- "time_BodyAccMag_std"
names(tidy_df)[names(tidy_df) == "tGravityAccMag-mean()"] <- "time_GravityAccMag_mean"
names(tidy_df)[names(tidy_df) == "tGravityAccMag-std()"] <- "time_GravityAccMag_std"
names(tidy_df)[names(tidy_df) == "tBodyAccJerkMag-mean()"] <- "time_BodyAccJerkMag_mean"
names(tidy_df)[names(tidy_df) == "tBodyAccJerkMag-std()"] <- "time_BodyAccJerkMag_std"
names(tidy_df)[names(tidy_df) == "tBodyGyroMag-mean()"] <- "time_BodyGyroMag_mean"
names(tidy_df)[names(tidy_df) == "tBodyGyroMag-std()"] <- "time_BodyGyroMag_std"
names(tidy_df)[names(tidy_df) == "tBodyGyroJerkMag-mean()"] <- "time_BodyGyroJerkMag_mean"
names(tidy_df)[names(tidy_df) == "tBodyGyroJerkMag-std()"] <- "time_BodyGyroJerkMag_std"
names(tidy_df)[names(tidy_df) == "fBodyAccMag-mean()"] <- "freq_BodyGyroJerkMag_mean"
names(tidy_df)[names(tidy_df) == "fBodyAccMag-std()"] <- "freq_BodyGyroJerkMag_std"
names(tidy_df)[names(tidy_df) == "fBodyBodyAccJerkMag-mean()"] <- "freq_BodyBodyAccJerkMag_mean"
names(tidy_df)[names(tidy_df) == "fBodyBodyAccJerkMag-std()"] <- "freq_BodyBodyAccJerkMag_std"
names(tidy_df)[names(tidy_df) == "fBodyBodyGyroMag-mean()"] <- "freq_BodyBodyGyroMag_mean"
names(tidy_df)[names(tidy_df) == "fBodyBodyGyroMag-std()"] <- "freq_BodyBodyGyroMag_std"
names(tidy_df)[names(tidy_df) == "fBodyBodyGyroJerkMag-mean()"] <- "freq_BodyBodyGyroJerkMag_mean"
names(tidy_df)[names(tidy_df) == "fBodyBodyGyroJerkMag-std()"] <- "freq_BodyBodyGyroJerkMag_std"

#create sum of sum dataset
tidy_df_grouped<-grouped_df(tidy_df, c("subject_id","activity_names"))
tidy_sum_df<-summarise_all(tidy_df_grouped, mean)

#cleanup
rm(activity_df)
rm(features_df)
rm(sub_test_df)
rm(sub_train_df)
rm(X_test_df)
rm(y_test_df)
rm(y_train_df)
rm(X_train_df)
rm(header_list)
rm(features_to_extract)
rm(activity_names)
rm(activity_vector)
rm(tidy_df)
rm(tidy_df_grouped)