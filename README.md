# Tidy-Data-Assignment
This project is Coursera Getting and Cleaning Data Course porject. 

The goal of this project is to create a clean and tidy data set from raw data sets for future analysis. The data used in this project is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The files containg in this projects are:<br /> 
**CodeBook.md** a code book that describe the the how the data sets are being cleaned in each steps. <br />
**run_analysis.R** clean the data sets with the following steps: <br />
    + Merges the train and the test sets.<br />
    + Extracts mean and standard deviation for each measurement.<br />
    + Uses descriptive activity names to name the activities in the data set.<br />
    + Appropriately labels the data set with descriptive variable names.<br />
    + Creates a second, independent tidy data set with the average of each variable for each activity and each subject.<br />
**new_data.txt** is the data set create in the last step of run_analysis.