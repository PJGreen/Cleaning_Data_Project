# Cleaning_Data_Project
repo to hold project for cleaning data project
The script run_analysis.R will create a dataset that contains 180 rows and 20 columns.
The columns include the factors subject_id and activity_names
The remainder columns are means of all mean and standard deviation measures brought in from larger datasets.

Prior to reading test/train data, the script reads activity data into a dataframe.  It then vectorizes the activity_name column.  This will be used to convert activity ids later in the script.

The script reads in features labels next.  These will be used name the columns of the test/train data below.  From these features, we only want to use a subset of labels eventually, which are those that end with "mean()" or "std()".  We use lgrep functionality to derive these column names

The script works by tidying the test data and then the train data.
The script
1. Reads in the features for test (x_test.txt)
2. Names the columns from the features bector
3. Extracts only the columns of interest that it calculated with the lgrep function.
4. Reads the activity ids (y_test.txt)
5. Derives the activity name associated with these ids
6. Binds the activity names to the test features data set 
7. Reads in the subject ids (subject_test.txt) and binds them to the activity and features dataframe.

The script then operates on the train data in a simlar fashion:
1. Reads in the features for train (x_train.txt)
2. Names the columns from the features bector
3. Extracts only the columns of interest that it calculated with the lgrep function.
4. Reads the activity ids (y_train.txt)
5. Derives the activity name associated with these ids
6. Binds the activity names to the test subject_id/features data set 
7. Reads in the subject ids (subject_train.txt) and binds them to the activity and features dataframe.

The script then row binds the results of the test and train tidying, It makes subject_id a factor (for grouping later on) and applies meaningful names to the dataset features.

Finally, the dataset is grouped by subject_id and activity_names and summarized by applying the mean function the remaining measures.  All intermediate dataframes and objects used to create the final tidy_sum_df are removed.
