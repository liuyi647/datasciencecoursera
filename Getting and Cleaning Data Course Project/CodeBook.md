# Clean Data Set of Getting and Cleaning Data Course Project  
The clean data set is the result of Getting and Cleaning Data Course Project. 

The project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

## Raw Data

[Human Activity Recognition database](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) is used as raw data in the project. The data is availble [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

This data included both the raw sampled data (folder ../Inertial Signals) and features apparently based on the raw data. For the purpose of this project, I am only looking at the features, not the raw data.

There are 3 types of files:

*x*: rows of feature measurements
*y*: the activity labels corresponding to each row of X. Encoded as numbers.
*subject*: the subjects on which each row of X was measured. Encoded as numbers.
In addition, to determine which features are required, we look at the list of features:

*features.txt*
The encoding from activity labels ids to descriptive names.

*activity_labels.txt*

## Clean Data
tidyData.txt contains the average of each variable for each activity and each person, ordered by *personId* and *activityId*

## Data Transformation
### create column names
1. Assigned column names to X_train data (*X_train.txt*) using feature data (*feature.txt*)
2. Assigned column name '*activityId*' to Y_train data (*Y_train.txt*)
3. Assigned column name '*personId*' to Person data (*subject_train.txt*)
4. Repeated the above operations for test data (*X_test.txt*, *y_test.txt* and *subject_test.txt*)

### Merge into a big data set
5. Bound X_train, Y_train and Persion_train into Train data set (column bind)
6. Bound X_test, Y_test and Persion_test into Test data set (column bind)
7. Bound Train and Test data set into one large data set (row bind)

### Operations for the project requirement
8. Extracted only the measurements on the mean and standard deviation for each measurement
9. Used descriptive activity names to name the activities
10. Created a second, independent tidy data set with the average of each variable for each activity and each subject
11. Ordered the tidy data by *personId* and *activityId*
12. Export the tidy data to *tidyData.txt*

## Data Variables
The first 3 variables are
|Variable Name|Variable Class|Description||Value Range|
|personId|Integer|Id of person who takes part in the experiment|1:30|
|activityId|Integer|Id of activities|1:6|
|activityType|String|6 activities that persons have done in the experiment|WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING|

The following rest variables are the signals collected in the experiment.
For the detail explanation, please read [variable info](https://github.com/liuyi647/datasciencecoursera/blob/master/Getting%20and%20Cleaning%20Data%20Course%20Project/features_info.txt)

tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-mean()
tBodyAccMag-std()
tGravityAccMag-mean()
tGravityAccMag-std()
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()
tBodyGyroMag-mean()
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAcc-meanFreq()-X
fBodyAcc-meanFreq()-Y
fBodyAcc-meanFreq()-Z
fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyAccJerk-meanFreq()-X
fBodyAccJerk-meanFreq()-Y
fBodyAccJerk-meanFreq()-Z
fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyGyro-meanFreq()-X
fBodyGyro-meanFreq()-Y
fBodyGyro-meanFreq()-Z
fBodyAccMag-mean()
fBodyAccMag-std()
fBodyAccMag-meanFreq()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()
fBodyBodyAccJerkMag-meanFreq()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std()
fBodyBodyGyroMag-meanFreq()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()
fBodyBodyGyroJerkMag-meanFreq()





