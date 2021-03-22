# Tidy-Data-Assignment - CodeBook

The run_analysis.R process the target data sets by following steps:<br />

1.  Download the Data sets: Simply download the data sets, store the data sets and unzip the package as well. <br />

2.  Load the data sets: According to the information provided by the readme and features info documents <br />
    *   features <- features.txt,  this table contain 561 features names that were recorded, the second column renamed as feature <br />
    *   activity_labels <- activity_labels.txt, this table contain all 6 types of movements with corresponding code, the first column renamed as code
    *   X_train <- X_train.txt, this table contains traning data, and the names of the columns are assigned by feature table <br />
    *   subject_train <- subject_train.txt, this table contains corresponding subject number of the traning data set   <br />
    *   Y_train <- y_train.txt, this table contains corresponding codes of activities of the traning data set <br />
    *   X_test <- X_test.txt" this table contains test data, and the names of the columns are assigned by feature table<br />
    *   subject_test <- subject_test.txt,this table contains corresponding subject number of the test data set <br />
    *   Y_test <- y_test.txt, this table contains corresponding codes of activities of the test data set.<br />
    
3.  Merge the training and test data sets <br />
    *   TRAIN, is the train data set merged by three data sets, X_train, Y_train and subject_train, merged by columns
    *   TEST, is the test data set merged by three data sets, X_test, Y_test and subject_test, merged by columns
    * M_data, is the data set merged by TRAIN and TEST by row

4.  Select all mean and std columns
    *   The M_data is subseted by select, via using the contains argument to select the column with column names conatining mean and std

5.  Use descriptive name of the activities to the data set
    *   By matching the code column in M_data with the code in activity_labels, the second column of activity_labels can return the descriptive name to replace the code column in M_data
    
6.  Appropriately labels the data set with descriptive variable names
    *   code column in renamed as activities
    *   All Acc in column’s name replaced by Accelerometer
    *   All Gyro in column’s name replaced by Gyroscope
    *   All BodyBody in column’s name replaced by Body
    *   All Mag in column’s name replaced by Magnitude
    *   All start with character f in column’s name replaced by Frequency
    *   All start with character t in column’s name replaced by Time

7.  Creates a second, independent tidy data set with the average of each variable for each activity and each subject
    *   Using subject than activity column as the rules for grouping, then to apply summerise function to calculate the means of each group into a new_data, and create a new_data.txt